import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/login/LoginResponse.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterResponse.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterRequest.dart';
abstract class AuthRemoteDataSource { // as interface
  Future<LoginResponse>login(LoginRequest request);
  Future<RegisterResponse>register(RegisterRequest request);
}
