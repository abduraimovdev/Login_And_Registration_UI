import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/pages/admin_page.dart';
import 'package:ui_one/features/auth/presentation/pages/intro_page.dart';
import 'package:ui_one/features/auth/presentation/pages/search_page.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_up_page.dart';

class AppWidget extends StatefulWidget {
  static Map<String, Object> loggedUser = {};
  static bool isLogin = false;
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppWidget.isLogin ? const AdminPage() :const  IntroPage(),
      routes: {
        IntroPage.id: (context) => const IntroPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        SignInPage.id: (context) => const SignInPage(),
        SearchScreen.id: (context) => const SearchScreen(),
        AdminPage.id: (context) => const AdminPage(),
      },
    );
  }
}
