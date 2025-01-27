import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProducts {
  final ProductRepository _productRepository;
  GetProducts(this._productRepository);
  Future<Either<Failure, List<Product>>> call(String?categoryId)=>_productRepository.getProducts(categoryId: categoryId);
}