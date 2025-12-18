import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/icon_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;
  final VoidCallback? onNotificationTap;
  final bool showNotificationDot;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBack,
    this.onNotificationTap,
    this.showNotificationDot = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Container(
        color: AppColors.white,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Container(
            height: preferredSize.height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                // ⬅ Back Button
                if (showBack)
                  GestureDetector(
                    onTap: onBack ?? () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                      color: AppColors.black,
                    ),
                  )
                else
                  const SizedBox(width: 22),

                // Title
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: getTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),

                // Notification
                GestureDetector(
                    onTap: onNotificationTap,
                    child: Image.asset(IconPath.notification,
                        width: 24, height: 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
