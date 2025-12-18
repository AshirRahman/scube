import 'package:flutter/material.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';
import '../model/data_cost_model.dart';

class EnergyChartCard extends StatelessWidget {
  final String title;
  final String value;
  final List<DataCostModel> items;

  const EnergyChartCard({
    super.key,
    required this.title,
    required this.value,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey400),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: getTextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                Text(value,
                    style: getTextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ...items.asMap().entries.map((entry) {
            final idx = entry.key;
            final e = entry.value;
            final dotColors = [
              AppColors.blueAccent,
              AppColors.lightBlue,
              AppColors.purpleAccent,
              AppColors.orangeAccent,
            ];
            final dotColor = dotColors[idx % dotColors.length];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.grey400),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 88,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  color: dotColor, shape: BoxShape.circle)),
                          const SizedBox(height: 8),
                          Text(e.label,
                              textAlign: TextAlign.center,
                              style: getTextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                        width: 2,
                        height: 48,
                        decoration: BoxDecoration(
                            color: AppColors.grey300,
                            borderRadius: BorderRadius.circular(2))),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Data',
                                  style: getTextStyle(
                                      fontSize: 13, color: AppColors.grey700)),
                              const SizedBox(width: 8),
                              Text(':',
                                  style: getTextStyle(
                                      fontSize: 13, color: AppColors.grey700)),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Text(
                                      '${e.data.toStringAsFixed(2)} (${e.percentage.toStringAsFixed(2)}%)',
                                      style: getTextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700))),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text('Cost',
                                  style: getTextStyle(
                                      fontSize: 13, color: AppColors.grey700)),
                              const SizedBox(width: 8),
                              Text(':',
                                  style: getTextStyle(
                                      fontSize: 13, color: AppColors.grey700)),
                              const SizedBox(width: 8),
                              Text('${e.cost.toStringAsFixed(0)} ৳',
                                  style: getTextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
