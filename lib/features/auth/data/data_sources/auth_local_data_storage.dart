import 'dart:convert';

import 'package:ui_one/core/library/local_storage.dart';

abstract class AuthLocalDataSource {
  factory AuthLocalDataSource({required LocalStoage storage}) =>
      AuthLocalDataSourceImple(storage: storage);

  Map<String, Object> signUp(String email, Map<String, Object> data);
  Map<String, Object> signIn(String email, String password);
  Map<String, Map<String, Object?>> viewAllData();
  Map<String, Object> deleteAccount(String email);
}

class AuthLocalDataSourceImple implements AuthLocalDataSource {
  final LocalStoage storage;

  AuthLocalDataSourceImple({required this.storage});

  @override
  Map<String, Object> signUp(String email, Map<String, Object> data) {
    String json = jsonEncode(data);
    bool isSuccess = storage.createData(key: email, value: json);
    if (isSuccess) {
      return {
        "message": "Succesfuly Created",
        "success": isSuccess,
        "data": "no-data",
      };
    } else {
      return {
        "message": "Already User !!",
        "success": isSuccess,
        "data": "no-data",
      };
    }
  }

  @override
  Map<String, Object> signIn(String email, String password) {
    String? getUser = storage.readData(key: email);
    if (getUser == null) {
      return {
        "message": "User Not Found !!",
        "success": false,
        "data": "no-data",
      };
    }

    Map<String, Object?> json = jsonDecode(getUser) as Map<String, Object?>;
    if (json["password"] == password) {
      return {
        "message": "Succesfuly Logged In !!",
        "success": true,
        "data": "no_data",
      };
    } else {
      return {
        "message": "Wrong Password !!",
        "success": false,
        "data": "no_data",
      };
    }
  }

  @override
  Map<String, Map<String, Object?>> viewAllData() {
    Map<String, Map<String, Object?>> datas = {};
    for (final item in storage.readAllData().entries) {
      datas[item.key] = jsonDecode(item.value) as Map<String, Object?>;
    }
    return datas;
  }

  Map<String, Object> deleteAccount(String email) {
    String? user = storage.deleteData(key: email);
    if (user == null) {
      return {
        "message": "Email Not Found !!",
        "success": false,
        "data": "no_data",
      };
    } else {
      return {
        "message": "Succesfult Deleted !!",
        "success": true,
        "data": "$user",
      };
    }
  }
}
