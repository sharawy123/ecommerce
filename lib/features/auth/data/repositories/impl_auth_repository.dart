import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterRequest.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/local/auth_local_data_source.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
@singleton
class ImplAuthRepository {
  final    AuthRemoteDataSource _authRemoteDataAsource;
  final    AuthLocalDataSource _authLocalDataAsource;
  ImplAuthRepository(this._authRemoteDataAsource,this._authLocalDataAsource);
  Future<Either<Failure,UserModel>> register (RegisterRequest request)async{
   try {
      final response = await _authRemoteDataAsource.register(request);
      _authLocalDataAsource.saveToken(response.token);
      return Right(response.user);
    }on AppExceptions catch (e){
     return Left(Failure(e.message));
   }
  }
  Future <Either<Failure,UserModel>> login(LoginRequest request) async {
    try{
      final response = await _authRemoteDataAsource.login(request);
      await _authLocalDataAsource.saveToken(response.token);
      return Right(response.user);
    }on AppExceptions catch (e){
      return Left(Failure(e.message));
    }
  }
}
