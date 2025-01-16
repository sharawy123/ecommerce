import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterRequest.dart';
import 'package:ecommerce/features/auth/data/repositories/impl_auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// viewModel
@singleton
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._authRepo) : super(AuthInitState());
  final  ImplAuthRepository _authRepo ;

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _authRepo.register(request);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _authRepo.login(request);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
