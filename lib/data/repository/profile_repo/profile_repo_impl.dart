import 'package:dartz/dartz.dart';
import 'package:tezda/app/app.dart';
import 'package:tezda/core/constants/api_declartion.dart';
import 'package:tezda/core/exception/exception.dart';
import 'package:tezda/core/service/localstorage_service/localstorage_manager/localstorage_manager.dart';
import 'package:tezda/core/service/network_service/network_response.dart';
import 'package:tezda/core/service/network_service/network_service.dart';
import 'package:tezda/data/models/profile/profile_details_obj.dart';
import 'package:tezda/data/repository/profile_repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final _networkService = locator<NetworkService>();

  @override
  Future<Either<Failure, NetworkResponse<ProfileDetails>>>
      getProfileDetails() async {
    final response = await _networkService.getUri(
      ApiUri.profile,
    );
    return response.fold((l) => Left(l), (r) async {
      final profile = ProfileDetails.fromJson(r.data);
      await LocalStorageManager.setProfileDetails(profile);
      return Right(
        NetworkResponse(
          data: profile,
          statusCode: r.statusCode,
          statusMessage: r.statusMessage,
        ),
      );
    });
  }
}
