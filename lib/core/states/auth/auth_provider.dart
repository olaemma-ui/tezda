import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/core/states/auth/auth_controller.dart';
import 'package:tezda/core/states/auth/auth_state.dart';
import 'package:tezda/data/repository/auth_repo/auth_repo.dart';
import 'package:tezda/app/app.dart';


final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(locator<AuthRepo>());
});

