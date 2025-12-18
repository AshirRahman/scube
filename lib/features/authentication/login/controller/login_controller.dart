import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/features/dashboard/View/dashboard_view.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  // Text Controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // UI States
  final isPasswordHidden = true.obs;
  final isLoading = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  // Login action
  Future<void> login() async {
    isLoading.value = true;

    final loginData = LoginModel(
      username: usernameController.text.trim(),
      password: passwordController.text,
    );

    // TODO: API integration
    await Future.delayed(const Duration(milliseconds: 300));

    debugPrint("LOGIN DATA => ${loginData.toJson()}");

    // Navigate after success
    Get.off(() => DashboardView());

    isLoading.value = false;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
