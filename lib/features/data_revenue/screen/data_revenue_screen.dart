import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/widgets/custom_appbar.dart';
import '../controller/data_revenue_controller.dart';
import '../widget/view_toggle_tab.dart';
import '../widget/metric_circle.dart';
import '../widget/date_filter_section.dart';
import '../widget/energy_chart_card.dart';
import '../widget/data_cost_expandable.dart';

class DataRevenueScreen extends StatelessWidget {
  DataRevenueScreen({super.key});

  final controller = Get.put(DataRevenueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaf4ff),

      // App bar
      appBar: CustomAppBar(
        title: "SCM",
        showBack: true,
        onBack: Get.back,
        showNotificationDot: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Main White Card
                    Container(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - 48,
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        border: Border.all(
                          color: const Color(0xFFD6D6E8),
                          width: 1.4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Obx(() {
                        final isDataView = controller.selectedView.value ==
                            DataRevenueViewType.data;
                        final isRevenueView = controller.selectedView.value ==
                            DataRevenueViewType.revenue;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            // Metric
                            Center(
                              child: MetricCircle(
                                value: controller.metricValue,
                                unit: controller.metricUnit,
                              ),
                            ),

                            // Date Filter
                            if (isDataView)
                              DateFilterSection(
                                isCustomDate: controller.isCustomDate,
                                onTodayTap: () =>
                                    controller.isCustomDate.value = false,
                                onCustomTap: () =>
                                    controller.isCustomDate.value = true,
                                onSearchTap: () {},
                              ),

                            if (isDataView) const SizedBox(height: 20),

                            // Energy Chart
                            if (isDataView) ...[
                              if (controller.isCustomDate.value)
                                EnergyChartCard(
                                  title: "Energy Chart",
                                  value:
                                      "${controller.metricValue.value.toStringAsFixed(2)} kw",
                                  items: controller.dataCostList,
                                ),
                              if (controller.isCustomDate.value)
                                const SizedBox(height: 16),
                              EnergyChartCard(
                                title: "Energy Chart",
                                value: "5.53 kw",
                                items: controller.dataCostList,
                              ),
                            ],

                            // Revenue View
                            if (isRevenueView)
                              DataCostExpandable(
                                expanded: controller.isExpanded,
                                items: controller.dataCostList,
                                onToggle: controller.toggleExpand,
                              ),
                          ],
                        );
                      }),
                    ),

                    // View Toggle Tab
                    Positioned(
                      top: -22,
                      left: 24,
                      right: 24,
                      child: Center(
                        child: ViewToggleTab(
                          selected: controller.selectedView,
                          onTap: controller.toggleView,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
