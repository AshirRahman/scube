import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:scube/core/common/styles/global_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  final RxBool? obscureRx;
  final VoidCallback? onToggle;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.validator,
    this.obscureRx,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (!isPassword) {
      return _buildTextField(false);
    }

    return Obx(() {
      final bool obscure = obscureRx?.value ?? true;
      return _buildTextField(obscure);
    });
  }

  Widget _buildTextField(bool obscure) {
    return TextFormField(
      style: getTextStyle(color: AppColors.black),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: getTextStyle(color: AppColors.grey),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onToggle,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
