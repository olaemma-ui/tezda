import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/core/service/localstorage_service/localstorage_manager/localstorage_manager.dart';
import 'package:tezda/data/models/profile/profile_details_obj.dart';

final profileProvider =
    StateNotifierProvider<ProfileController, ProfileDetails?>((ref) {
  return ProfileController();
});

class ProfileController extends StateNotifier<ProfileDetails?> {
  ProfileController() : super(null) {
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await LocalStorageManager.userProfile;
    state = profile ??
        ProfileDetails(
          id: 0,
          username: '',
          email: '',
          firstName: '',
          lastName: '',
          gender: '',
          image: '',
          accessToken: '',
          refreshToken: '',
        );
  }

  Future<void> updateName(String name) async {
    if (state == null) return;
    final updated = state!
        .copyWith(firstName: name.split(' ')[0], lastName: name.split(' ')[1]);
    state = updated;
    await LocalStorageManager.saveUserProfile(updated);
  }

  Future<void> updateEmail(String email) async {
    if (state == null) return;
    final updated = state!.copyWith(email: email);
    state = updated;
    await LocalStorageManager.saveUserProfile(updated);
  }

  Future<void> updatePhoto(String url) async {
    if (state == null) return;
    // final updated = state!.copyWith(photoUrl: url);
    // state = updated;
    // await LocalStorageManager.saveUserProfile(updated);
  }

  Future<void> clearProfile() async {
    await LocalStorageManager.clearUserProfile();
    state = null;
  }
}
