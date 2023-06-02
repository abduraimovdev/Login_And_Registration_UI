import "package:flutter/material.dart";
import 'package:ui_one/features/auth/presentation/pages/app_widget.dart';
import 'package:ui_one/service._locator.dart';

void main() {
  setupLocator();
  runApp(const AppWidget());
}
