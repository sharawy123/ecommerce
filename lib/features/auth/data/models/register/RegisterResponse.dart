import 'package:ecommerce/features/auth/data/models/user_model.dart';

class RegisterResponse {
  late final String _message;
  late final UserModel _user;
  late final String _token;

  RegisterResponse({
    required String message,
    required UserModel user,
    required String token,
  }) {
    _message = message;
    _user = user;
    _token = token;
  }

  RegisterResponse.fromJson(Map<String, dynamic> json)
      : _message = json['message'],
        _user = UserModel.fromJson(json['user']),
        _token = json['token'];

  RegisterResponse copyWith({
    required String message,
    required UserModel user,
    required String token,
  }) =>
      RegisterResponse(
        message: message,
        user: user,
        token: token,
      );

  String get message => _message;
  UserModel get user => _user;
  String get token => _token;
}
