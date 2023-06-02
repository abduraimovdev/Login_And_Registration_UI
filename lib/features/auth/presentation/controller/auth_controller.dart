import 'package:ui_one/features/auth/presentation/validator/auth_validator.dart';

import '../../domain/entities/user.dart';
import '../../domain/repasitory/auth_repository.dart';

class AuthController {
  AuthController._();
  static final AuthController _instance = AuthController._();
  factory AuthController(AuthRepository repository) {
    authRepository = repository;
    return _instance;
  }
  static late final AuthRepository authRepository;

  Map<String, String> registration(
    String name,
    String email,
    String password,
  ) {
    Map<String, String> result = {};

    if (AuthValidator.isNameValid(name) != null) {
      result["message"] = "Wrong Name";
      result["next"] = "not";
      return result;
    }

    if (AuthValidator.isEmailValid(email) != null) {
      result["message"] = "Wrong Email";
      result["next"] = "not";
      return result;
    }

    if (AuthValidator.isPasswordValid(password) != null) {
      result["message"] = "Wrong Password";
      result["next"] = "not";
      return result;
    }

    final user = User("20", name, email, password);
    final response = authRepository.signUp(user);
    result["message"] = response["message"] as String;
    result["next"] = (response["success"] as bool) ? "next" : "not";
    return result;
  }

  Map<String, String> login(
    String email,
    String password,
  ) {
    Map<String, String> result = {};

    if (AuthValidator.isEmailValid(email) != null) {
      result["message"] = "Wrong Email";
      result["next"] = "not";
      return result;
    }

    if (AuthValidator.isPasswordValid(password) != null) {
      result["message"] = "Wrong Password !!";
      result["next"] = "not";
      return result;
    }

    final response = authRepository.signIn(email, password);
    result["message"] = response["message"] as String;
    result["next"] = (response["success"] as bool) ? "next" : "not";
    return result;
  }

  Map<String, Object> deleteAccount(String email) {
    return authRepository.deleteAccount(email);
  }
  Map<String, Map<String, Object?>> viewAllData() {
    return authRepository.viewAllData();
  }
}
