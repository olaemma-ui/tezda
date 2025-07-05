// lib/core/states/auth/auth_controller.dart
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/core/logger/logger.dart';
import 'package:tezda/core/service/localstorage_service/localstorage_manager/localstorage_manager.dart';
import 'package:tezda/core/states/auth/auth_state.dart';
import 'package:tezda/data/models/auth/login_request.dart';
import 'package:tezda/data/repository/auth_repo/auth_repo.dart';

class AuthController extends StateNotifier<AuthState> {
  final _log = buildLogger("AuthController");

  AuthController(this._authRepo) : super(const AuthState.loading()) {
    _init(); // ➊ do the storage check immediately
  }

  final AuthRepo _authRepo;

  Future<void> _init() async => checkAuth(); // keep constructor tidy

  Future<void> checkAuth() async {
    final token = await LocalStorageManager.accessToken;
    final profile = await LocalStorageManager.profileDetails;

    _log.d('checkAuth → token=$token profile=$profile');

    // ➋ OPTIONAL ‑ check token expiry if it’s a JWT
    final isValid = token != null && !_isTokenExpired(token);

    state = isValid && profile != null
        ? AuthState.authenticated(profile)
        : const AuthState.unauthenticated();
  }

  bool _isTokenExpired(String jwt) {
    // Quick‑n‑dirty decode of a JWT expiry; adapt to your format.
    try {
      final parts = jwt.split('.');
      if (parts.length != 3) return true;
      final payload =
          String.fromCharCodes(base64Url.decode(base64Url.normalize(parts[1])));
      final exp = DateTime.fromMillisecondsSinceEpoch(
        (jsonDecode(payload)['exp'] as int) * 1000,
      );
      _log.d('isTokenExpired → exp=$exp');
      return DateTime.now().isAfter(exp);
    } catch (_) {
      _log.e('isTokenExpired → error=$_');
      return true;
    }
  }

  Future<void> login(String username, String password) async {
    state = const AuthState.loading();

    final result = await _authRepo.login(
      request: LoginRequest(username: username, password: password),
    );

    state = result.fold(
      (failure) => AuthState.failure(failure.prettyMessage),
      (userResponse) => AuthState.authenticated(userResponse.data!),
    );
  }

  Future<void> logout() async {
    await LocalStorageManager.clearAll();
    state = const AuthState.unauthenticated();
  }
}
