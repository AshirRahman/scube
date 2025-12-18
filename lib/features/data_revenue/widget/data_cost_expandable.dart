import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:scube/core/utils/constants/icon_path.dart';
import '../model/data_cost_model.dart';

class DataCostExpandable extends StatelessWidget {
  final RxBool expanded;
  final List<DataCostModel> items;
  final VoidCallback onToggle;

  const DataCostExpandable({
    super.key,
    required this.expanded,
    required this.items,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isExpanded = expanded.value;

      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey400),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Header
            GestureDetector(
              onTap: onToggle,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.bar_chart),
                    const SizedBox(width: 8),
                    Text(
                      "Data & Cost Info",
                      style: getTextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Image.asset(
                      isExpanded ? IconPath.upArrow : IconPath.downArrow,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),

            // Expanded content
            if (isExpanded) ...[
              Divider(height: 1, color: AppColors.grey400),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final e = entry.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Data ${index + 1} : ",
                                style: getTextStyle(
                                  fontSize: 13,
                                  color: AppColors.grey700,
                                ),
                              ),
                              Text(
                                "${e.data} (${e.percentage}%)",
                                style: getTextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                "Cost ${index + 1} : ",
                                style: getTextStyle(
                                  fontSize: 13,
                                  color: AppColors.grey700,
                                ),
                              ),
                              Text(
                                "${e.cost} ৳",
                                style: getTextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      );
    });
  }
}
