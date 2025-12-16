import 'package:flutter/material.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:scube/core/common/styles/global_text_style.dart';

class PowerCircle extends StatelessWidget {
  final String title;
  final String value;

  const PowerCircle({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: getTextStyle(fontSize: 12)),
          Text(
            value,
            style: getTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
