import 'package:ui_one/features/auth/data/data_sources/auth_local_data_storage.dart';
import 'package:ui_one/features/auth/data/models/user_converter.dart';
import 'package:ui_one/features/auth/domain/repasitory/auth_repository.dart';

import '../../domain/entities/user.dart';

class AuthRepositoryImple implements AuthRepository {
  final AuthLocalDataSource dataSource;
  final UserConverter userConverter;
  AuthRepositoryImple({required this.dataSource, required this.userConverter});

  @override
  Map<String, Object> signUp(User user) {
    final data = userConverter.toJson(user);
    return dataSource.signUp(user.email, data);
  }

  @override
  Map<String, Object> signIn(String email, String password) {
    return dataSource.signIn(email, password);
  }

  @override
  Map<String, Object> deleteAccount(String email) {
    return dataSource.deleteAccount(email);
  }

  @override
  editProfile() {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  forgotPassword() {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  viewProfile() {
    // TODO: implement viewProfile
    throw UnimplementedError();
  }

  @override
  Map<String, Map<String, Object?>> viewAllData() {
    return dataSource.viewAllData();
  }
}
