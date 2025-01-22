import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/category_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: HomeRemoteDataSource)
class  HomeApiRemoteDataSource implements HomeRemoteDataSource{
  final Dio _dio;
   String? message;
  HomeApiRemoteDataSource(this._dio);
  @override
  Future<CategoryResponse> getCategories() async {
    try{
      final respone = await _dio.get(APIConstants.categoryEndPoint);
      return CategoryResponse.fromJson(respone.data);
    }catch(e){
      if(e is DioException){
        message = e.response?.data['message'];
      }
      throw (message ?? "failed to get categories");
    }
  }
}