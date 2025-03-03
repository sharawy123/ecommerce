import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/mappers/cart_mappers.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CartRepository )
class CartRepositoryImpl implements CartRepository{
  final CartRemoteDataSource _cartRemoteDataSource;
  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<Either<Failure, void>> addToCart(String productId) async {
    try{
      await _cartRemoteDataSource.addToCart(productId);
      return const Right(null);
    } on RemoteException catch(e){
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> deleteFromCart(String productId)async {
    try{
      final response = await _cartRemoteDataSource.deleteFromCart(productId);
      return Right(response.data.toEntity);
    } on RemoteException catch(e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart()async {
    try{
      final response = await _cartRemoteDataSource.getCart();
      return Right(response.data.toEntity);
    } on RemoteException catch(e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateCart(String productId, int quantity) async {
    try{
      final response = await _cartRemoteDataSource.updateCart(productId,quantity);
      return Right(response.data.toEntity);
    } on RemoteException catch(e) {
      return Left(Failure(e.message));
    }
  }
}