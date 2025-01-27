import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/products/data/data_source/remote/product_remote_data_source.dart';
import 'package:ecommerce/features/products/data/models/product_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductApiRemoteDataSource implements ProductRemoteDataSource {
  final Dio _dio;
 String ?message;
  ProductApiRemoteDataSource(this._dio);

  @override
  Future<ProductResponse> getProducts({String? categoryId}) async {
    try {
      final response = await _dio.get(
        APIConstants.productEndPoint,
        queryParameters: {
          if(categoryId !=null) 'category': categoryId,
        },
      );
      return ProductResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      if (e is DioException){

        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get Products');
    }
  }
}
