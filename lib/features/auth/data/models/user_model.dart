class UserModel {
  UserModel({
    required String name,
    required String email,
    required String role,}){
    _name=name;
    _email=email;
    _role=role;
  }
  late String _name;
  late String _email;
  late String _role;

  UserModel.fromJson(dynamic json) {
    _name = json['name']as String;
    _email = json['email']as String;
    _role = json['role']as String;
  }
  UserModel copyWith({ required String name,
   required String email,
   required String role,
  }) => UserModel(  name: name ,
    email: email,
    role: role,
  );
  String get name => _name;
  String get email => _email;
  String get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['role'] = _role;
    return map;
  }

}
