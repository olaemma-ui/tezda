import 'package:dartz/dartz.dart';
import 'package:tezda/core/exception/exception.dart';
import 'package:tezda/core/service/network_service/network_response.dart';
import 'package:tezda/data/models/product_object.dart';

abstract class ProductRepo {
  Future<Either<Failure, NetworkResponse<List<Product>>>> getProducts();

  Future<Either<Failure, NetworkResponse<Product>>> getProduct(String id);
}
