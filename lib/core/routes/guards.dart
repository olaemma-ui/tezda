import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/core/enums/app_routes_enum.dart';
import 'package:tezda/core/states/auth/auth_provider.dart';


// lib/router/guards.dart
GoRouterRedirect createAuthRedirect(Ref ref) {
  return (_, state) {
    final authState = ref.read(authProvider);

    final onLoginRoute = state.matchedLocation == AppRoute.login.path;

    return authState.maybeWhen(
      unauthenticated: () => onLoginRoute ? null : AppRoute.login.path,
      authenticated: (_) => onLoginRoute ? AppRoute.products.path : null,
      orElse: () => null, // loading / failure → let Splash decide
    );
  };
}

