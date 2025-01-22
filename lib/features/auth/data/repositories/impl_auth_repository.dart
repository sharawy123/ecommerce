import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/mappers/user_mappers.dart';
import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterRequest.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/local/auth_local_data_source.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
@Singleton(as:AuthRepository)
class ImplAuthRepository implements AuthRepository{
  final    AuthRemoteDataSource _authRemoteDataAsource;
  final    AuthLocalDataSource _authLocalDataAsource;
  ImplAuthRepository(this._authRemoteDataAsource,this._authLocalDataAsource);
  @override
  Future<Either<Failure,User>> register (RegisterRequest request)async{
   try {
      final response = await _authRemoteDataAsource.register(request);
      _authLocalDataAsource.saveToken(response.token);
      return Right(response.user.toEntity);
    }on AppExceptions catch (e){
     return Left(Failure(e.message));
   }
  }
  @override
  Future <Either<Failure,User>> login(LoginRequest request) async {
    try{
      final response = await _authRemoteDataAsource.login(request);
      await _authLocalDataAsource.saveToken(response.token);
      return Right(response.user.toEntity);
    }on AppExceptions catch (e){
      return Left(Failure(e.message));
    }
  }
}
