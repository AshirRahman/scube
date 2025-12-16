import 'package:scube/core/common/widgets/custom_button.dart';
import 'package:scube/core/common/widgets/custom_textfield.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/utils/constants/image_path.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            // 🔵 Top Section
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImagePath.logo,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "SCUBE",
                    style: getTextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Control & Monitoring System",
                    style: getTextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            // ⚪ Login Card
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Login",
                          style: getTextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 👤 Username
                      CustomTextField(
                        controller: controller.usernameController,
                        hintText: "Username",
                        prefixIcon: Icons.person_outline,
                      ),

                      const SizedBox(height: 16),

                      // 🔐 Password (GetX controlled)
                      CustomTextField(
                        controller: controller.passwordController,
                        hintText: "Password",
                        isPassword: true,
                        prefixIcon: Icons.lock_outline,
                        obscureRx: controller.isPasswordHidden,
                        onToggle: controller.togglePasswordVisibility,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Forget password?",
                              style: getTextStyle(
                                fontSize: 14,
                                color: AppColors.primary,
                              )),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 🔘 Login Button
                      Obx(() {
                        return CustomButton(
                          title: "Login",
                          isLoading: controller.isLoading.value,
                          onTap: controller.login,
                        );
                      }),

                      const SizedBox(height: 16),

                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have any account? ",
                            style: getTextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Register Now",
                                style: getTextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
