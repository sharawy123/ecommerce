 import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/login/LoginRequest.dart';
import '../../data/models/register/RegisterRequest.dart';

abstract class AuthRepository {
   Future<Either<Failure,User>> register (RegisterRequest request);
   Future <Either<Failure,User>> login (LoginRequest request);

}