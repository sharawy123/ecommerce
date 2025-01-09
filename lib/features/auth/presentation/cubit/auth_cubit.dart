import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterRequest.dart';
import 'package:ecommerce/features/auth/data/repositories/impl_auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 // viewModel
class AuthCubit  extends Cubit <AuthStates>{
  AuthCubit() : super(AuthInitState());
  final _authRepo = ImplAuthRepository();
  Future <void>register(RegisterRequest request)async{
    emit(RegisterLoading());
    try{
      await _authRepo.register(request);
      emit(RegisterSuccess());
    }catch(e){
    emit(RegisterError(e.toString()));
    }
  }
  Future <void>login(LoginRequest request)async{
    emit(LoginLoading());
    try{
      await _authRepo.login(request);
      emit(LoginSuccess());
    }catch(e){
      emit(LoginError(e.toString()));
    }
  }
}
