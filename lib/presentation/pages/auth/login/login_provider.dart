import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controller/login_controller.dart';
import 'state/login_form_state.dart';

final loginFormControllerProvider =
    StateNotifierProvider<LoginController, LoginFormState>(
  (ref) => LoginController(ref),
);
