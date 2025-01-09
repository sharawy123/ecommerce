abstract class AuthStates {}
class AuthInitState extends AuthStates{}
class RegisterError extends AuthStates{
  final String message;
  RegisterError(this.message);
}
class RegisterSuccess extends AuthStates{}
class RegisterLoading extends AuthStates{}

class LoginError extends AuthStates{
  final String message;
  LoginError(this.message);
}
class LoginSuccess extends AuthStates{}
class LoginLoading extends AuthStates{}
