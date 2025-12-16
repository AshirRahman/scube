import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/features/dashboard/screen/dashboard_screen.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isPasswordHidden = true.obs;

  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  void login() async {
    isLoading.value = true;

    final model = LoginModel(
      username: usernameController.text.trim(),
      password: passwordController.text,
    );

    // TODO: API call
    await Future.delayed(const Duration(seconds: 0));

    debugPrint("LOGIN DATA => ${model.toString()}");
    Get.to(DashboardScreen());

    isLoading.value = false;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
