import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/login/LoginResponse.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterResponse.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterRequest.dart';

class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: APIConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response =
    await _dio.post(APIConstants.loginEndPoint, data: request.toJson());
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    final response =
    await _dio.post(APIConstants.registerEndPoint, data: request.toJson());
    return RegisterResponse.fromJson(response.data);
  }
}
