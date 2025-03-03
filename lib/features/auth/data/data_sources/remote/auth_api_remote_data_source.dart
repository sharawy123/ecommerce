import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/login/LoginResponse.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterResponse.dart';
import 'package:injectable/injectable.dart';

import '../../models/register/RegisterRequest.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio;
  const AuthApiRemoteDataSource(this._dio);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
     String ? message;
    try{
      final response =
          await _dio.post(APIConstants.loginEndPoint, data: request.toJson());
      return LoginResponse.fromJson(response.data);
    }catch(exception){
      if(exception is DioException){
         message = exception.response?.data['message'];
      }

    }throw RemoteException(message ??'failed to login');

  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try{
      final response = await _dio.post(APIConstants.registerEndPoint,
          data: request.toJson(),);
      return RegisterResponse.fromJson(response.data);
    }catch(exception){
      String ? message;
      if(exception is DioException){
      message =exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to register');
    }
  }
}
