import 'package:dartz/dartz.dart';
import 'package:tezda/core/exception/exception.dart';
import 'package:tezda/core/service/network_service/network_response.dart';
import 'package:tezda/data/models/auth/login_request.dart';
import 'package:tezda/data/models/profile/profile_details_obj.dart';

/// AuthRepo defines the contract for authentication-related operations,
/// including login, token refresh, signup, and password reset functionalities.
abstract class AuthRepo {
  /// Performs the login operation with the provided [LoginRequest] data.
  ///
  /// Takes a [LoginRequest] object containing login credentials, sends them
  /// to the API, and returns either a [Failure] in case of an error, or a
  /// [NetworkResponse] wrapping an [ApiResponse] if the login is successful.
  ///
  /// - [request] : The login request data containing username and password.
  ///
  /// Returns:
   Future<Either<Failure, NetworkResponse<ProfileDetails>>> login({
    required LoginRequest request,
  });
}
