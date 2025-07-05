// lib/router/app_router.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/core/enums/app_routes_enum.dart';
import 'package:tezda/core/states/auth/auth_provider.dart';
import 'package:tezda/core/utils/go_router_refresh_stream.dart';
import 'package:tezda/presentation/pages/auth/login/login_view.dart';
import 'package:tezda/presentation/pages/onboarding/splash_screen/splash_screen_ui.dart';
import 'package:tezda/presentation/pages/product/product_details.dart';
import 'package:tezda/presentation/pages/product/product_list.dart';
import 'package:tezda/presentation/pages/profile/profile.dart';
import 'guards.dart';

class AppRouter {
  AppRouter._(this._router);

  final GoRouter _router;
  GoRouter get router => _router;

  factory AppRouter(Ref ref) {
    return AppRouter._(
      GoRouter(
        debugLogDiagnostics: kDebugMode,
        initialLocation: AppRoute.splash.path,
        refreshListenable: GoRouterRefreshStream(
          ref.read(authProvider.notifier).stream,
        ),
        redirect: createAuthRedirect(ref), // ✅ use the fixed function here
        routes: [
          GoRoute(
            path: AppRoute.splash.path,
            name: AppRoute.splash.name,
            builder: (_, __) => const SplashScreen(),
          ),
          GoRoute(
            path: AppRoute.login.path,
            name: AppRoute.login.name,
            builder: (_, __) => const LoginView(),
          ),
          GoRoute(
            path: AppRoute.products.path,
            name: AppRoute.products.name,
            builder: (_, __) => const ProductListScreen(),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.productDetail.name,
                builder: (_, state) {
                  final id = state.pathParameters['id']!;
                  return ProductDetailScreen(productId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.profile.path,
            name: AppRoute.profile.name,
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),
    );
  }
}
