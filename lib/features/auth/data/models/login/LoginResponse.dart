import 'package:ecommerce/features/auth/data/models/user_model.dart';

class LoginResponse {
  LoginResponse({
    required  String message,
   required UserModel user,
   required   String token,}){
    _message = message;
    _user = user;
    _token = token;
}

  LoginResponse.fromJson(dynamic json) {
    _message = json['message'] ;
    _user = UserModel.fromJson(json['user']); // Fix here
    _token = json['token'] ;
  }
  late String _message;
  late UserModel _user;
  late String _token;
LoginResponse copyWith({  required String message,
  required UserModel user,
  required String token,
}) => LoginResponse(  message: message,
  user: user ,
  token: token,
);
  String get message => _message;
  UserModel get user => _user;
  String get token => _token;
}
