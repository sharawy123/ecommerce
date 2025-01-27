import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/data/data_source/remote/product_remote_data_source.dart';
import 'package:ecommerce/features/products/data/mappers/product_mappers.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProductRepository )
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts({String? categoryId}) async {
    try {
      final response =
          await _productRemoteDataSource.getProducts(categoryId: categoryId);
      final products =
          response.products.map((product) => product.toEntity).toList();
      return Right(products);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
