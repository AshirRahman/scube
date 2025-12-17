import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';

class DashboardTabs extends StatelessWidget {
  final RxInt selectedIndex;
  final List<String> tabs;
  final ValueChanged<int> onTap;

  const DashboardTabs({
    super.key,
    required this.selectedIndex,
    required this.tabs,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: AppColors.grey, width: 1),
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = selectedIndex.value == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => onTap(index),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: getTextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
