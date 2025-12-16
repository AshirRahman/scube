import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:scube/core/common/styles/global_text_style.dart';

class SourceLoadToggle extends StatelessWidget {
  final RxInt selectedIndex;
  final List<String> options;
  final Function(int) onTap;

  const SourceLoadToggle({
    super.key,
    required this.selectedIndex,
    required this.options,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: 200,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: options.asMap().entries.map((e) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(e.key),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selectedIndex.value == e.key
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
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
        ),
      );
    });
  }
}
