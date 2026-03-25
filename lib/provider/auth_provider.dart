import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_3_5/service/auth_service.dart';

class AuthProviderr extends ChangeNotifier {
  AuthService authService = AuthService();
  bool isLoading = false;

  Future<User?> register(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      User? user = await authService.register(email, password);
      isLoading = false;
      notifyListeners();
      return user;
    } catch (e) {
      log("$e");
      return null;
    } finally {
      log("Helloo");
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      User? user = await authService.login(email, password);

      isLoading = false;
      notifyListeners();
      return user;
    } catch (e) {
      log("$e");
      return null;
    }
  }
}
