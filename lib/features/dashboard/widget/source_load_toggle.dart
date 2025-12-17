import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';

class SourceLoadToggle extends StatelessWidget {
  final RxInt selectedIndex;
  final List<String> options;
  final ValueChanged<int> onTap;

  const SourceLoadToggle({
    super.key,
    required this.selectedIndex,
    required this.options,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: 200,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: List.generate(options.length, (index) {
              final isSelected = selectedIndex.value == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        options[index],
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
      ),
    );
  }
}
