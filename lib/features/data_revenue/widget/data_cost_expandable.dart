import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
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
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: onToggle,
              child: Row(
                children: [
                  const Icon(Icons.bar_chart),
                  const SizedBox(width: 8),
                  Text(
                    "Data & Cost Info",
                    style: getTextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Icon(
                    expanded.value ? Icons.expand_less : Icons.expand_more,
                  ),
                ],
              ),
            ),
            if (expanded.value) ...[
              const SizedBox(height: 12),
              ...items.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.label, style: getTextStyle(fontSize: 13)),
                        Text(
                          "${e.data} (${e.percentage}%)",
                          style: getTextStyle(fontSize: 13),
                        ),
                        Text("${e.cost} ৳", style: getTextStyle(fontSize: 13)),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      );
    });
  }
}
