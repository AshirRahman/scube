import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';
import '../controller/data_revenue_controller.dart';

class ViewToggleTab extends StatelessWidget {
  final Rx<DataRevenueViewType> selected;
  final Function(DataRevenueViewType) onTap;

  const ViewToggleTab({
    super.key,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: DataRevenueViewType.values.map((e) {
            final isActive = selected.value == e;
            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => onTap(e),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // indicator: blue filled with inner white for active, grey ring for inactive
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.white : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isActive
                                ? AppColors.primary
                                : Colors.grey.shade400,
                            width: isActive ? 2 : 1.6,
                          ),
                        ),
                        child: Center(
                          child: isActive
                              ? Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                )
                              : Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Text(
                        e == DataRevenueViewType.data
                            ? 'Data View'
                            : 'Revenue View',
                        style: getTextStyle(
                          fontSize: 16,
                          color: isActive
                              ? AppColors.primary
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
