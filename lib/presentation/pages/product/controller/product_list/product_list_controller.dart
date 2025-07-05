import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/presentation/pages/product/provider/product_provider.dart';
import 'package:tezda/data/models/product_object.dart';
import 'package:tezda/data/repository/product_repo/product_repo.dart';
import 'package:tezda/core/exception/exception.dart';

class ProductListController extends StateNotifier<AsyncValue<List<Product>>> {
  ProductListController(this._repo) : super(const AsyncValue.loading()) {
    fetchProducts();
  }

  final ProductRepo _repo;

  Future<void> fetchProducts() async {
    state = const AsyncValue.loading();

    final result = await _repo.getProducts();

    state = result.fold(
      (Failure f) => AsyncValue.error(f.prettyMessage, StackTrace.current),
      (resp) => AsyncValue.data(resp.data ?? []),
    );
  }
}

final productListProvider =
    StateNotifierProvider<ProductListController, AsyncValue<List<Product>>>(
  (ref) => ProductListController(ref.watch(productRepoProvider)),
);
