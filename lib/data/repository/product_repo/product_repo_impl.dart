// lib/data/repository/product_repo/product_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:tezda/app/app.dart';
import 'package:tezda/core/constants/api_declartion.dart';
import 'package:tezda/core/exception/exception.dart';
import 'package:tezda/core/service/network_service/network_response.dart';
import 'package:tezda/core/service/network_service/network_service.dart';
import 'package:tezda/data/models/product_object.dart';
import 'package:tezda/data/repository/product_repo/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final _networkService = locator<NetworkService>();

  /// Single product by id
  @override
  Future<Either<Failure, NetworkResponse<Product>>> getProduct(
      String id) async {
    final response = await _networkService.getUri(ApiUri.product(id));

    return response.fold(
      // Failure straight through
      (failure) => Left(failure),
      // Success mapping
      (r) {
        final product = Product.fromJson(r.data);
        return Right(
          NetworkResponse<Product>(
            data: product,
            statusCode: r.statusCode,
            statusMessage: r.statusMessage,
          ),
        );
      },
    );
  }

  /// Entire product list
  @override
  Future<Either<Failure, NetworkResponse<List<Product>>>> getProducts() async {
    final response = await _networkService.getUri(ApiUri.products);

    return response.fold(
      (failure) => Left(failure),
      (r) {
        final products = (r.data['products'] as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList();

        return Right(
          NetworkResponse<List<Product>>(
            data: products,
            statusCode: r.statusCode,
            statusMessage: r.statusMessage,
          ),
        );
      },
    );
  }
}
