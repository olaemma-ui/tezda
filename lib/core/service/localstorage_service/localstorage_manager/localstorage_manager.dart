import 'dart:convert';

import 'package:tezda/app/app.dart';
import 'package:tezda/core/enums/enums.dart';
import 'package:tezda/data/models/profile/profile_details_obj.dart';

import '../local_storage_service.dart';

/// LocalStorageManager provides static methods to manage all local storage operations
/// for user data, app data, authentication tokens, profile, and settings.
/// It acts as a centralized API for reading and writing persistent data using the underlying LocalStorageService.
///
/// Key responsibilities:
/// - Store and retrieve authentication state, tokens, cookies
/// - Manage lists (currencies, languages, countries, parks)
/// - Store and retrieve user profile and selfie/face recognition data
/// - Track first-time launch and login state
/// - Provide clearAll for logout or app reset
abstract class LocalStorageManager {
  /// The underlying service that actually reads/writes to local storage (Hive, etc.)
  static final _localstorageService = locator<LocalStorageService>();

  /// Clears all user and app data from local storage except APP_DATA.
  /// Useful for logout or app reset.
  static Future<void> clearAll() async {
    LocalStorageBox.values.forEach((box) async {
      if (box != LocalStorageBox.APP_DATA) {
        await _localstorageService.clearAll(box: box);
      }
    });
  }

  /// Returns true if the user is logged in, false otherwise.
  static Future<bool> get isLoggedIn async =>
      (await _localstorageService.findByKey<bool?>(
        box: LocalStorageBox.USER_DATA,
        key: LocalStorageKey.IS_LOGGEDIN,
      )) ??
      true;

  /// Sets the user as logged in (used after successful login).
  static Future<void> setIsLoggedIn() async {
    await _localstorageService.storeByKey<bool?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.IS_LOGGEDIN,
      data: true,
    );
  }

  /// Returns true if the app is launched for the first time on this device.
  static Future<bool> get isFirstTime async =>
      (await _localstorageService.findByKey<bool?>(
        box: LocalStorageBox.APP_DATA,
        key: LocalStorageKey.FIRST_TIME,
      )) ??
      true;

  /// Marks that the app has been launched at least once (not first time anymore).
  static Future<void> setIsFirstTime() async {
    await _localstorageService.storeByKey<bool?>(
      box: LocalStorageBox.APP_DATA,
      key: LocalStorageKey.FIRST_TIME,
      data: false,
    );
  }

  /// Retrieves the stored access token (JWT or similar) from local storage.
  static Future<String?> get accessToken async =>
      (await _localstorageService.findByKey<String?>(
        box: LocalStorageBox.USER_DATA,
        key: LocalStorageKey.ACCESS_TOKEN,
      )) ??
      '';

  /// Stores the access token (JWT or similar) in local storage.
  static Future<void> setAccessToken(String? token) async {
    await _localstorageService.storeByKey<String?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.ACCESS_TOKEN,
      data: token,
    );
  }

  /// Retrieves the stored refresh token (JWT or similar) from local storage.
  static Future<String?> get refreshToken async =>
      (await _localstorageService.findByKey<String?>(
        box: LocalStorageBox.USER_DATA,
        key: LocalStorageKey.REFRESH_TOKEN,
      )) ??
      '';

  /// Stores the refresh token (JWT or similar) in local storage.
  static Future<void> setRefreshToken(String? token) async {
    await _localstorageService.storeByKey<String?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.REFRESH_TOKEN,
      data: token,
    );
  }

  /// Retrieves the profile details of the current user from local storage.
  /// Returns null if not found.
  static Future<ProfileDetails?> get profileDetails async {
    final data = await _localstorageService.findByKey<Map<dynamic, dynamic>?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.PROFILE,
    );

    final json = data != null ? jsonEncode(data) : null;
    print('json: $json');

    return json != null ? ProfileDetails.fromJson(jsonDecode(json)) : null;
  }

  /// Stores the profile details of the current user in local storage (as JSON).
  static Future<void> setProfileDetails(ProfileDetails value) async {
    await _localstorageService.storeByKey<Map<String, dynamic>?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.PROFILE,
      data: value.toJson(),
    );
  }

  /// Return a List<int> of favorited product IDs, empty if none.
  static Future<Set<int>> get favoriteIds async {
    final data = await _localstorageService.findByKey<List<dynamic>?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.FAVORITES,
    );

    return data?.map((e) => int.parse(e.toString())).toSet() ?? {};
  }

  static Future<void> saveFavoriteIds(Set<int> ids) async {
    final list = ids.map((e) => e.toString()).toSet();

    await _localstorageService.storeByKey<Set<dynamic>?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.FAVORITES,
      data: list,
    );
  }

  static Future<void> toggleFavorite(int productId) async {
    final ids = await favoriteIds;
    if (ids.contains(productId)) {
      await saveFavoriteIds(ids.where((e) => e != productId).toSet());
    } else {
      await saveFavoriteIds({...ids, productId});
    }
  }



  /// Returns the saved user profile, or `null` if none.
  static Future<ProfileDetails?> get userProfile async {
    final data = await _localstorageService.findByKey<Map<dynamic, dynamic>?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.PROFILE,
    );

    final json = data != null ? jsonEncode(data) : null;
    print('json: $json');

    if (json == null) return null;

    try {
      final map = jsonDecode(json) as Map<String, dynamic>;
      return ProfileDetails.fromJson(map);
    } catch (_) {
      // Corrupt data – clear it
      await _localstorageService.deleteByKey(
        box: LocalStorageBox.USER_DATA,
        key: LocalStorageKey.PROFILE,
      );
      return null;
    }
  }

  /// Persist profile to storage
  static Future<void> saveUserProfile(ProfileDetails profile) async {
    await _localstorageService.storeByKey<Map<String, dynamic>?>(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.PROFILE,
      data: profile.toJson(),
    );
  }

  /// Clear stored profile
  static Future<void> clearUserProfile() async {
    await _localstorageService.deleteByKey(
      box: LocalStorageBox.USER_DATA,
      key: LocalStorageKey.PROFILE,
    );
  }
}
