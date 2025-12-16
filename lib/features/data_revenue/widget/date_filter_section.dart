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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🔹 Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _radio(
                selected: !isCustomDate.value,
                label: "Today Data",
                onTap: onTodayTap,
              ),
              const SizedBox(width: 16),
              _radio(
                selected: isCustomDate.value,
                label: "Custom Date Data",
                onTap: onCustomTap,
              ),
            ],
          ),

          if (isCustomDate.value) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                _dateBox("From Date"),
                const SizedBox(width: 8),
                _dateBox("To Date"),
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
                )
              ],
            )
          ]
        ],
      );
    });
  }

  Widget _radio({
    required bool selected,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: selected ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? AppColors.primary : Colors.grey.shade400,
                width: selected ? 2 : 1.6,
              ),
            ),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: getTextStyle(
              fontSize: 13,
              color: selected ? AppColors.primary : Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _dateBox(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: getTextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            const Icon(Icons.calendar_today, size: 14),
          ],
        ),
      ),
    );
  }
}
