class RegisterRequest {
  late String _name;
  late String _email;
  late String _password;
  late String _rePassword;
  late String _phone;

  RegisterRequest({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    _name = name;
    _email = email;
    _password = password;
    _phone = phone;
    _rePassword = password; // This seems to be used as a confirmation password.
  }

  RegisterRequest.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _rePassword = json['password']; // Ensure both passwords are identical.
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['name'] = _name;
    map['rePassword'] = _password; // Send password again for confirmation.
    map['phone'] = _phone;
    return map;
  }

  RegisterRequest copyWith({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) =>
      RegisterRequest(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get rePassword => _rePassword;
  String get phone => _phone;
}
