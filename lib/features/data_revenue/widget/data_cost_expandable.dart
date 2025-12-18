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
          border: Border.all(color: AppColors.grey300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // ================= HEADER =================
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

            // ================= EXPANDED CONTENT =================
            if (isExpanded) ...[
              Divider(height: 1, color: AppColors.grey300),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: items.map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Data ${e.label} : ",
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
                                "Cost ${e.label} : ",
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
