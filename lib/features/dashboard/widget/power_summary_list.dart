import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';
import '../model/power_summary_model.dart';

class PowerSummaryList extends StatelessWidget {
  final List<PowerSummaryModel> items;
  final void Function(PowerSummaryModel item)? onItemTap;
  final EdgeInsetsGeometry padding;

  const PowerSummaryList({
    super.key,
    required this.items,
    this.onItemTap,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _emptyState();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return GestureDetector(
          onTap: () => onItemTap?.call(item),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.25),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  item.icon,
                  width: 28,
                  height: 28,
                ),

                const SizedBox(width: 12),

                // 🔹 TEXT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item.title,
                            style: getTextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            item.isActive ? "(Active)" : "(Inactive)",
                            style: getTextStyle(
                              fontSize: 12,
                              color: item.isActive ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Data 1 : ${item.data1}",
                        style: getTextStyle(fontSize: 13),
                      ),
                      Text(
                        "Data 2 : ${item.data2}",
                        style: getTextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 🔹 Empty state (optional)
  Widget _emptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        "No data available",
        style: getTextStyle(color: Colors.grey),
      ),
    );
  }
}
