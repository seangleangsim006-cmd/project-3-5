import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_3_5/provider/auth_provider.dart';
import 'package:project_3_5/view/auth/register_screen.dart';
import 'package:project_3_5/view/home/home_screen.dart';
import 'package:project_3_5/widget/custom_button.dart';
import 'package:project_3_5/widget/custom_text.dart';
import 'package:project_3_5/widget/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProviderr>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 100,
          bottom: 20,
        ),
        child: Column(
          children: [
            Text(
              "Login here",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            CustomText(text: "Login to explore everything in this app"),
            SizedBox(height: 20),

            CustomTextfield(
              text: "Email",
              icon: Icons.email,
              controller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextfield(
              text: "Password",
              icon: Icons.password,
              controller: passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontFamily: 'Datatype',
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Button
            CustomButton(
              text: (authProvider.isLoading) ? "Loading" : "login",
              onPressed: () async {
                User? user = await authProvider.login(
                  emailController.text,
                  passwordController.text,
                );
                if (user != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                "Create new account",
                style: TextStyle(fontFamily: 'Datatype', color: Colors.black),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Or Continue",
              style: TextStyle(
                fontFamily: 'Datatype',
                color: Colors.deepOrange,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google-logo.png", width: 40),
                Image.asset("assets/images/google-logo.png", width: 40),
                Image.asset("assets/images/google-logo.png", width: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
