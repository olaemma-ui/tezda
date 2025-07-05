import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:stack_trace/stack_trace.dart';

/// ANSI colour helpers (works on macOS/Linux & Windows 10+)
extension _AnsiColour on String {
  static const reset = '\x1B[0m';
  String red() => '\x1B[31m$this$reset';
  String yellow() => '\x1B[33m$this$reset';
  String green() => '\x1B[32m$this$reset';
  String blue() => '\x1B[34m$this$reset';
}

/// *** SIMPLE *** printer: method → class → line → level → message
class SimpleDebugPrinter extends LogPrinter {
  SimpleDebugPrinter(this._className);

  final String _className;
  static final _levelColor = {
    Level.verbose: (String s) => s.blue(),
    Level.debug: (String s) => s.green(),
    Level.info: (String s) => s.blue(),
    Level.warning: (String s) => s.yellow(),
    Level.error: (String s) => s.red(),
    Level.wtf: (String s) => s.red(),
  };

  @override
  List<String> log(LogEvent e) {
    // Skip completely in release/profile
    if (kReleaseMode || kProfileMode) return [];

    // We want the *first* frame outside logger.dart
    final frame = Trace.current(2)
        .frames
        .firstWhere((f) => f.package?.startsWith('logger') ?? false);

    final location =
        '${frame.member} (${frame.uri.pathSegments.last}:${frame.line})';

    // Build prefix with colours
    final colour = _levelColor[e.level] ?? (String s) => s;
    final levelLabel = e.level.toString().toUpperCase().padRight(7);

    final buffer = StringBuffer()
      ..write(colour('$location  │  $levelLabel  │  ${e.message}'));

    // Error object & stack
    if (e.error != null) {
      buffer
        ..writeln()
        ..writeln('ERROR TYPE: ${e.error.runtimeType}')
        ..writeln('STACKTRACE:')
        ..writeln(e.stackTrace ?? '');
    }

    return buffer.toString().split('\n');
  }
}

Logger buildLogger(String className) {
  // Return a no‑op logger in release to avoid `if (kDebugMode)` checks everywhere.
  if (kReleaseMode || kProfileMode) {
    return Logger(
      level: Level.nothing,
      filter: ProductionFilter(), // nothing prints
    );
  }

  return Logger(
    printer: SimpleDebugPrinter(className),
    level: Level.verbose, // allow all in debug
    output: ConsoleOutput(), // default stdout
  );
}
