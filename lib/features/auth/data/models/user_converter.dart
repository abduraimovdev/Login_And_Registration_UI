import 'package:ui_one/features/auth/domain/entities/user.dart';

class UserConverter {
  UserConverter._();
  static final _instance = UserConverter._();
  factory UserConverter() => _instance;

  User fromJson(Map<String, Object> data) {
    return User(
      "10",
      data["name"] as String,
      data["email"] as String,
      data["password"] as String,
    );
  }

  Map<String, Object> toJson(User user) => {
        "id": user.id,
        "name": user.name,
        "email": user.email,
        "password": user.password,
      };
}
