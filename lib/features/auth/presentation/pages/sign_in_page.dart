import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/pages/admin_page.dart';
import 'package:ui_one/features/auth/presentation/pages/app_widget.dart';
import 'package:ui_one/features/auth/presentation/validator/auth_validator.dart';
import 'package:ui_one/service._locator.dart';

import '../components/buttons.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sign_in_page";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signInGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordSee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              width: 100,
              height: 100,
            ),
            const Center(
              child: Text(
                "Welcome back!\nSign in to continue!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 100,
              height: 100,
            ),
            Column(
              children: const [
                MyButton(
                  iconUrl: 'assets/images/ic_google.png',
                  text: "Log in with Google",
                ),
                SizedBox(height: 20),
                MyButton(
                  iconUrl: 'assets/images/ic_facebook.png',
                  text: "Log in with Google",
                ),
                SizedBox(height: 20),
                Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Form(
              key: _signInGlobalKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: AuthValidator.isEmailValid,
                    decoration:
                        const InputDecoration(hintText: "email address"),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: passwordController,
                    obscureText: passwordSee,
                    validator: AuthValidator.isPasswordValid,
                    decoration: InputDecoration(
                      hintText: "password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          passwordSee = !passwordSee;
                          setState(() {});
                        },
                        child: Icon(
                          passwordSee
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Column(
              children: [
                MyButtonTwo(text: "Log in", onPressed: signIn),
                const SizedBox(height: 30),
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xFF265AE8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signIn() {
    if (_signInGlobalKey.currentState!.validate()) {
      final message = authController.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message["message"] as String),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .9),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          shape: const StadiumBorder(),
          dismissDirection: DismissDirection.horizontal,
          showCloseIcon: true,
        ),
      );
      if (message["next"] == "next") {
        AppWidget.isLogin = true;
        AppWidget.loggedUser["email"] = emailController.text.trim();
        AppWidget.loggedUser["password"] = passwordController.text.trim();
        Navigator.pushNamed(context, AdminPage.id);
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
