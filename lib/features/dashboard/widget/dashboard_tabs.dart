import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:scube/core/common/styles/global_text_style.dart';

class DashboardTabs extends StatelessWidget {
  final RxInt selectedIndex;
  final List<String> tabs;
  final Function(int) onTap;

  const DashboardTabs({
    super.key,
    required this.selectedIndex,
    required this.tabs,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: AppColors.grey, width: 1)),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        child: Row(
          children: tabs.asMap().entries.map((e) {
            return Expanded(
              child: GestureDetector(
                onTap: () => onTap(e.key),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: selectedIndex.value == e.key
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      e.value,
                      style: getTextStyle(
                        color: selectedIndex.value == e.key
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
