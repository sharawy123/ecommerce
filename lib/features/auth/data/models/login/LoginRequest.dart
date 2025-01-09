class LoginRequest {
  late final String _email;
  late final String _password;

  // Constructor to initialize the required fields
  LoginRequest({
    required String email,
    required String password,
  })  : _email = email,
        _password = password;

  // Constructor to create an instance from JSON
  LoginRequest.fromJson(Map<String, dynamic> json)
      : _email = json['email'],
        _password = json['password'];

  // Method to convert the object to JSON
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }
  // Copy method for cloning the object with updated values
  LoginRequest copyWith({
    required String email,
    required String password,
  }) =>
      LoginRequest(
        email: email,
        password: password,
      );

  // Getters for each field
  String get email => _email;
  String get password => _password;
}