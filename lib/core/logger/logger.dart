// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:tezda/core/logger/logs_builder.dart';

/// This method is used to build the logger
/// It is used to build the logger
/// It is used to build the logger
Logger buildLogger(String className) {
  // Return a no‑op logger in release to avoid `if (kDebugMode)` checks everywhere.
  if (kReleaseMode) {
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
