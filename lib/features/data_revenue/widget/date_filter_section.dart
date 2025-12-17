import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';

class DateFilterSection extends StatelessWidget {
  final RxBool isCustomDate;
  final VoidCallback onTodayTap;
  final VoidCallback onCustomTap;
  final VoidCallback onSearchTap;

  const DateFilterSection({
    super.key,
    required this.isCustomDate,
    required this.onTodayTap,
    required this.onCustomTap,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isCustom = isCustomDate.value;

      return Column(
        children: [
          // Toggle Options
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTodayTap,
                child: Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: !isCustom
                              ? AppColors.primary
                              : Colors.grey.shade400,
                          width: !isCustom ? 2 : 1.6,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: !isCustom
                                ? AppColors.primary
                                : Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Today Data",
                      style: getTextStyle(
                        fontSize: 13,
                        color: !isCustom ? AppColors.primary : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: onCustomTap,
                child: Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isCustom
                              ? AppColors.primary
                              : Colors.grey.shade400,
                          width: isCustom ? 2 : 1.6,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isCustom
                                ? AppColors.primary
                                : Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Custom Date Data",
                      style: getTextStyle(
                        fontSize: 13,
                        color: isCustom ? AppColors.primary : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Custom Date Picker
          if (isCustom) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "From Date",
                            style:
                                getTextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        const Icon(Icons.calendar_today, size: 14),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "To Date",
                            style:
                                getTextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        const Icon(Icons.calendar_today, size: 14),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onSearchTap,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      );
    });
  }
}
