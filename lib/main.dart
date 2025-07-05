import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tezda/app/app.dart';

import 'package:tezda/core/config/environment.dart';
import 'package:tezda/core/routes/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise your services / env
  await setupLocator(environment: EnvProcess.DEVELOPMENT);

  // Launch the app with Riverpod
  runApp(const ProviderScope(child: MyApp()));
}

/// Exposes a configured GoRouter to the widget tree.
final _routerProvider = Provider<GoRouter>(
  (ref) => AppRouter(ref).router,
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(_routerProvider);

    return MaterialApp.router(
      title: 'Tezda Interview App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
