import 'package:ecommerce/features/auth/data/models/user_model.dart';

import '../../domain/entities/user.dart';

extension  UserMappers on UserModel{
  User get toEntity => User(name: name, email: email, role: role);

}