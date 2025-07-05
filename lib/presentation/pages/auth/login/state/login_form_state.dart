import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default('') String username,
    @Default('') String password,
    String? usernameError,
    String? passwordError,
    @Default(false) bool showPassword,
    @Default(false) bool isSubmitting,
  }) = _LoginFormState;
}
