// lib/core/states/favorite/favorite_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/core/service/localstorage_service/localstorage_manager/localstorage_manager.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteController, Set<int>>((ref) {
  return FavoriteController();
});

class FavoriteController extends StateNotifier<Set<int>> {
  FavoriteController() : super({}) {
    _load(); // fetch from storage on init
  }

  Future<void> _load() async {
    state = await LocalStorageManager.favoriteIds.then((value) => value.toSet());
  }

  void toggleFavorite(int productId) async {
    final newSet = {...state};
    if (newSet.contains(productId)) {
      newSet.remove(productId);
    } else {
      newSet.add(productId);
    }
    state = newSet;
    await LocalStorageManager.saveFavoriteIds(newSet); // persist
  }

  bool isFavorite(int productId) => state.contains(productId);
}
