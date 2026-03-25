import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_3_5/provider/auth_provider.dart';
import 'package:project_3_5/view/home/home_screen.dart';
import 'package:project_3_5/widget/custom_button.dart';
import 'package:project_3_5/widget/custom_textfield.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
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
              "Register here",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Datatype',
                color: Colors.deepOrange,
              ),
            ),

            Text(
              "Register to explore everything in this app",
              style: TextStyle(fontSize: 20, fontFamily: 'Datatype'),
            ),
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
            SizedBox(height: 20),
            CustomTextfield(
              text: "Comfirm Password",
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
              text: (authProvider.isLoading) ? "loading" : "Register",
              onPressed: () async {
                User? user = await authProvider.register(
                  emailController.text,
                  passwordController.text,
                );
                if (user != null) {
                  // Navigate to home
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid email or password")),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {},
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
