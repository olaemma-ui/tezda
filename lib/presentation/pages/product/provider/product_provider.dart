import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda/app/app.dart';
import 'package:tezda/data/repository/product_repo/product_repo.dart';

final productRepoProvider = Provider<ProductRepo>((ref) {
  return locator<ProductRepo>();
});
