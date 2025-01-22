import 'package:ecommerce/features/auth/data/models/login/LoginRequest.dart';
import 'package:ecommerce/features/auth/data/models/register/RegisterRequest.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login.dart';
import 'package:ecommerce/features/auth/domain/use_cases/register.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// viewModel
@singleton
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._login,this._register) : super(AuthInitState());
  final Login _login;
  final Register _register;

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _register(request);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _login(request);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
