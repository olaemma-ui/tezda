import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/app/app.dart';
import 'package:tezda/presentation/pages/product/provider/product_provider.dart';
import 'package:tezda/data/models/product_object.dart';
import 'package:tezda/data/repository/product_repo/product_repo.dart';
import 'package:tezda/core/exception/exception.dart';

class ProductDetailController extends StateNotifier<AsyncValue<Product>> {
  ProductDetailController(this._repo, this.id)
      : super(const AsyncValue.loading()) {
    fetch();
  }

  final ProductRepo _repo;
  final String id;

  Future<void> fetch() async {
    state = const AsyncValue.loading();

    final result = await _repo.getProduct(id);

    state = result.fold(
      (Failure f) => AsyncValue.error(f.prettyMessage, StackTrace.current),
      (resp) => AsyncValue.data(resp.data ?? Product.empty()),
    );
  }
}

final productDetailProvider = StateNotifierProvider.family<
    ProductDetailController, AsyncValue<Product>, String>(
  (ref, id) => ProductDetailController(ref.watch(productRepoProvider), id),
);
