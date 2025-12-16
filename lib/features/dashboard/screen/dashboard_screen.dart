import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/common/widgets/custom_appbar.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:scube/features/dashboard/controller/dashboard_controller.dart';
import 'package:scube/features/dashboard/widget/dashboard_tabs.dart';
import 'package:scube/features/dashboard/widget/feature_grid_section.dart';
import 'package:scube/features/dashboard/widget/power_circle.dart';
import 'package:scube/features/dashboard/widget/power_summary_list.dart';
import 'package:scube/features/dashboard/widget/source_load_toggle.dart';
import 'package:scube/features/data_revenue/screen/data_revenue_screen.dart';
import 'package:scube/features/feature_details/screen/feature_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaf4ff),
      appBar: CustomAppBar(
        title: "SCM",
        showBack: true,
        onBack: () => Get.back(),
        onNotificationTap: () {},
        showNotificationDot: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // ✅ MAIN WHITE CARD (like screenshot)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DashboardTabs(
                    selectedIndex: controller.selectedTab,
                    tabs: const ["Summary", "SLD", "Data"],
                    onTap: (i) => controller.selectedTab.value = i,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      "Electricity",
                      style: getTextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(color: AppColors.grey, thickness: 1),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: PowerCircle(
                      title: "Total Power",
                      value: "5.53 kw",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SourceLoadToggle(
                      selectedIndex: controller.sourceLoad,
                      options: const ["Source", "Load"],
                      onTap: (i) => controller.sourceLoad.value = i,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(color: AppColors.grey, thickness: 1),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 0, bottom: 8),
                    child: PowerSummaryList(
                      items: controller.powerList,
                      onItemTap: (item) {
                        Get.to(DataRevenueScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            FeatureGridSection(
              items: controller.featureList,
              onTap: (item) {
                // Navigate to feature route
                Get.to(FeatureDetailScreen(feature: item));
              },
            ),
          ],
        ),
      ),
    );
  }
}
