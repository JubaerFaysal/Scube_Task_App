import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/screens/dashboard_screen/dashboard_screen.dart';

class LoginController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void login() {
    // Add your login logic here
    Get.off(() => DashboardScreen());
  }

  void forgotPassword() {
    // Add forgot password logic
  }

  void register() {
    // Add register navigation logic
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}