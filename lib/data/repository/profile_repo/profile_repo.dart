import 'package:dartz/dartz.dart';
import 'package:tezda/core/exception/exception.dart';
import 'package:tezda/core/service/network_service/network_response.dart';
import 'package:tezda/data/models/profile/profile_details_obj.dart';

abstract class ProfileRepo {
  Future<Either<Failure, NetworkResponse<ProfileDetails>>> getProfileDetails();
}
