import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;
  String? message;

  CartApiRemoteDataSource(this._dio);

  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await _dio.get(APIConstants.cartEndPoint);
      return CartResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        message = e.response?.data['message'];
        print(message);
      }
    }
    throw RemoteException(message ?? 'failed to get cart');
  }

  @override
  Future<void> addToCart(String productId) async {
    try {
       await _dio.post(
        APIConstants.cartEndPoint,
        data: {
          'productId': productId,
        },
      );
    } catch (e) {
      if (e is DioException) {
        message = e.response?.data['message'];
      }
    }
    throw RemoteException(message ?? 'failed to add product to cart');
  }

  @override
  Future<CartResponse> deleteFromCart(String productId) async {
    try {
      final response = await _dio.delete(
        '${APIConstants.cartEndPoint}/$productId',
      );
      return CartResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        message = e.response?.data['message'];
      }
    }
    throw RemoteException(message ?? "failed to delete product from cart");
  }

  @override
  Future<CartResponse> updateCart(String productId, int count) async {
    try {
      final response = await _dio.put(
        '${APIConstants.cartEndPoint}/$productId',
        data: {
          'count': count,
        },
      );
      return CartResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        message = e.response?.data['message'];
      }
    }
    throw RemoteException(message ?? "failed to delete product from cart");
  }
}
