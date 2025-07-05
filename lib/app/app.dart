import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tezda/core/config/environment.dart';
import 'package:tezda/core/service/firebase_service/firebase_service.dart';
import 'package:tezda/core/service/localstorage_service/local_storage_impl.dart';
import 'package:tezda/core/service/localstorage_service/local_storage_service.dart';
import 'package:tezda/core/service/network_service/network_service.dart';
import 'package:tezda/core/service/network_service/network_service_impl.dart';
import 'package:tezda/data/repository/auth_repo/auth_repo.dart';
import 'package:tezda/data/repository/auth_repo/auth_repo_impl.dart';
import 'package:tezda/data/repository/profile_repo/profile_repo.dart';
import 'package:tezda/data/repository/profile_repo/profile_repo_impl.dart';

final locator = GetIt.I;
// Logger logger = Logger();

setupLocator({
  required EnvProcess environment,
}) async {
  locator.registerLazySingleton<LocalStorageService>(
    () => LocalStorageServiceImpl(),
  );
  await LocalStorageService.init();

  // Ensure NetworkServiceImpl has the correct constructor and dependencies
  locator.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(),
  );

  locator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(),
  );

  locator.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(),
  );

  locator.registerLazySingleton<FirebaseService>(
    () => FirebaseService(),
  );
}
