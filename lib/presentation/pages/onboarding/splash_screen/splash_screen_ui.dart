// lib/presentation/pages/onboarding/splash_screen/splash_screen_ui.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tezda/core/states/auth/auth_provider.dart';
import 'package:tezda/core/states/auth/auth_state.dart';
import 'package:tezda/core/states/auth/auth_controller.dart';
import 'package:tezda/core/enums/app_routes_enum.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    ref.read(authProvider.notifier).checkAuth();

    ref.listenManual<AuthState>(authProvider, (_, next) {
      if (_navigated) return;
      next.mapOrNull(
        unauthenticated: (_) {
          _navigated = true;
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => context.go(AppRoute.login.path),
          );
        },
        authenticated: (_) {
          _navigated = true;
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => context.go(AppRoute.products.path),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
