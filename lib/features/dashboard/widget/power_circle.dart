import 'package:flutter/material.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';

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
        border: Border.all(
          color: AppColors.primary,
          width: 12,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: getTextStyle(fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
