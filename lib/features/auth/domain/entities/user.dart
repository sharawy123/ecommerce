class User {
  final String name;
  final String email;
  final String role;

   const User({
    required this. name,
    required this. email,
    required this. role,});
}

// User copyWith({ required String name,
//   required String email,
//   required String role,
// }) => User(  name: name ,
//   email: email,
//   role: role,
// );