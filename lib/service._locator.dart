import 'package:ui_one/core/library/local_storage.dart';

import 'features/auth/data/data_sources/auth_local_data_storage.dart';
import 'features/auth/data/models/user_converter.dart';
import 'features/auth/domain/repasitory/auth_repository.dart';
import 'features/auth/presentation/controller/auth_controller.dart';

late final AuthController authController;

// Service Locator: pattern and Dependedency Injection
void setupLocator() {
  // init
  final UserConverter userConverter = UserConverter();
  final storage = LocalStoage();
  final dataSource = AuthLocalDataSource(storage: storage);
  final AuthRepository repository =
      AuthRepository(dataSource: dataSource, userConverter: userConverter);

  authController = AuthController(repository);
}
