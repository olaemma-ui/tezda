import 'package:dartz/dartz.dart';
import 'package:tezda/app/app.dart';
import 'package:tezda/core/constants/api_declartion.dart';
import 'package:tezda/core/exception/exception.dart';
import 'package:tezda/core/service/localstorage_service/localstorage_manager/localstorage_manager.dart';
import 'package:tezda/core/service/network_service/network_response.dart';
import 'package:tezda/core/service/network_service/network_service.dart';
import 'package:tezda/data/models/auth/login_request.dart';
import 'package:tezda/data/models/profile/profile_details_obj.dart';
import 'package:tezda/data/repository/auth_repo/auth_repo.dart';

/// AuthRepoImpl provides the actual implementation of the [AuthRepo] contract,
/// handling API calls for authentication-related operations such as login, signup,
/// token refresh, and password reset.
class AuthRepoImpl extends AuthRepo {
  final NetworkService _networkService;

  AuthRepoImpl() : _networkService = locator<NetworkService>();

  /// Logs in a user by sending a login request to the API with the [LoginRequest] data.
  ///
  /// If the login is successful, it stores the returned token in local storage using
  /// [LocalStorageManager]. The method returns either a [Failure] if the login fails,
  /// or a [NetworkResponse] containing the login token if successful.
  ///
  /// - [request] : The login request containing user credentials.
  ///
  /// Returns:
  /// - [Either<Failure, NetworkResponse<ApiResponse>>]: A result indicating either a
  /// [Failure] or a successful login with a [NetworkResponse] that includes the token.
  @override
  Future<Either<Failure, NetworkResponse<ProfileDetails>>> login({
    required LoginRequest request,
  }) async {
    final response = await _networkService.postUri(
      ApiUri.login,
      body: request.toMap(),
    );
    return response.fold((l) => Left(l), (r) async {
      await LocalStorageManager.setAccessToken(r.data['accessToken']);
      await LocalStorageManager.setRefreshToken(r.data['refreshToken']);
      await LocalStorageManager.setProfileDetails(
        ProfileDetails.fromJson(r.data),
      );
      await LocalStorageManager.setIsLoggedIn();
      return Right(
        NetworkResponse(
          data: ProfileDetails.fromJson(r.data),
          statusCode: r.statusCode,
          statusMessage: r.statusMessage,
        ),
      );
    });
  }
}
