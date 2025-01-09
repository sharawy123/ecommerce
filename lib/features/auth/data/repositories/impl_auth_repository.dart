import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterRequest.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';
class ImplAuthRepository {
  final  _authRemoteDataAsource = AuthApiRemoteDataSource();
  final  _authLocalDataAsource = AuthSharedPrefLocalDataSource();
  Future<UserModel> register (RegisterRequest request)async{
    final response = await _authRemoteDataAsource.register(request);
    _authLocalDataAsource.saveToken(response.token);
    return response.user;
  }
  Future <UserModel> login(LoginRequest request) async {
   final response =await _authRemoteDataAsource.login(request);
    await _authLocalDataAsource.saveToken(response.token);
    return response.user;
  }
}
