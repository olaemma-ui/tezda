import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tezda/data/models/profile/profile_details_obj.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated(ProfileDetails profileDetails) =
      _Authenticated;
  const factory AuthState.failure(String message) = _Failure;
}
