import 'package:ui_one/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ui_one/features/auth/domain/entities/user.dart';

import '../../data/data_sources/auth_local_data_storage.dart';
import '../../data/models/user_converter.dart';

abstract class AuthRepository {
  // factory AuthRepository() => AuthRepositoryImpl();
  factory AuthRepository(
          {required AuthLocalDataSource dataSource,
          required UserConverter userConverter}) =>
      AuthRepositoryImple(dataSource: dataSource, userConverter: userConverter);
  // Bizness Logica shu yerda yoziladi

  Map<String, Object> signUp(User user);
  Map<String, Object> signIn(String email, String password);
  forgotPassword();
  Map<String, Object> deleteAccount(String email);
  editProfile();
  viewProfile();
  Map<String, Map<String, Object?>> viewAllData();
}
