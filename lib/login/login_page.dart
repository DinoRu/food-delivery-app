import 'package:flutter/material.dart';
import 'package:food_app/components/my_buttion.dart';
import 'package:food_app/components/my_textfield.dart';
import 'package:food_app/services/auth/auth_service.dart';

import '../pages/homepage/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    final _authService = AuthService();
    try {
      await _authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Email or password wrong!'),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //? LOGO
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // MESSAGE APP SLOGAN
            Text("Food delivery app",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),

            const SizedBox(height: 25),
            // EMAIL TEXTFIELD
            MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false),

            const SizedBox(height: 10),
            // PASSWORD TEXTFIELD
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 10),
            // SIGN IN BUTTON
            MyButton(text: 'Sign in', onTap: login),

            const SizedBox(height: 25),

            // NOT MEMBER? REGISTER NOW
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not member?',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                    onTap: widget.onTap, child: Text('Register now')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
