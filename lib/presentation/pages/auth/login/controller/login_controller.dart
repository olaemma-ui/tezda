import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/core/states/auth/auth_provider.dart';
import 'package:tezda/presentation/pages/auth/login/state/login_form_state.dart';

class LoginController extends StateNotifier<LoginFormState> {
  LoginController(this._ref) : super(const LoginFormState());
  final Ref _ref;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void setusername(String value) {
    usernameController.text = value;
    state = state.copyWith(username: value, usernameError: null);
  }

  void setPassword(String value) {
    passwordController.text = value;
    state = state.copyWith(password: value, passwordError: null);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  String? validatePassword() {
    final password = state.password.trim();
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  Future<void> submitLogin() async {
    final pswError = validatePassword();

    if (pswError != null) {
      state = state.copyWith(
        passwordError: pswError,
      );
      return;
    }

    state = state.copyWith(isSubmitting: true);

    await _ref
        .read(authProvider.notifier)
        .login(state.username.trim(), state.password.trim());

    state = state.copyWith(isSubmitting: false);
  }

  void disposeControllers() {
    usernameController.dispose();
    passwordController.dispose();
  }
}
