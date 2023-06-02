import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/pages/app_widget.dart';
import 'package:ui_one/features/auth/presentation/pages/intro_page.dart';

import '../components/list_tile.dart';

class AdminPage extends StatefulWidget {
  static const String id = "Admin_page";
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.abc,
              color: Colors.transparent,
            ),
            const Text("Amin Panel"),
            TextButton(
              onPressed: logOut,
              child: const Icon(
                Icons.logout_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: const SafeArea(
        child: ListTilee(),
      ),
    );
  }

  void logOut() {
    AppWidget.isLogin = false;
    AppWidget.loggedUser = {};
    Navigator.pushReplacementNamed(context, IntroPage.id);
  }
}
