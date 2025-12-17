import 'package:get/get.dart';
import 'package:scube/core/utils/constants/icon_path.dart';
import 'package:scube/features/dashboard/model/dashboard_feature_model.dart';
import '../model/power_summary_model.dart';

class DashboardController extends GetxController {
  // 🔹 UI State
  final selectedTab = 0.obs; // Summary / SLD / Data
  final sourceLoad = 0.obs; // Source / Load

  // 🔹 Power Summary
  final powerList = <PowerSummaryModel>[
    PowerSummaryModel(
      title: "Data View",
      isActive: true,
      data1: 55505.63,
      data2: 58805.63,
      icon: IconPath.solarCell,
    ),
    PowerSummaryModel(
      title: "Data Type 2",
      isActive: true,
      data1: 55505.63,
      data2: 58805.63,
      icon: IconPath.generator,
    ),
    PowerSummaryModel(
      title: "Data Type 3",
      isActive: false,
      data1: 55505.63,
      data2: 58805.63,
      icon: IconPath.networkTower,
    ),
  ].obs;

  // 🔹 Feature Grid
  final featureList = <DashboardFeatureModel>[
    DashboardFeatureModel(
      title: "Analysis Pro",
      icon: IconPath.analysis,
      route: "/analysis",
    ),
    DashboardFeatureModel(
      title: "G. Generator",
      icon: IconPath.generator,
      route: "/generator",
    ),
    DashboardFeatureModel(
      title: "Plant Summary",
      icon: IconPath.plant,
      route: "/plant-summary",
    ),
    DashboardFeatureModel(
      title: "Natural Gas",
      icon: IconPath.fire,
      route: "/natural-gas",
    ),
    DashboardFeatureModel(
      title: "D. Generator",
      icon: IconPath.generator,
      route: "/diesel-generator",
    ),
    DashboardFeatureModel(
      title: "Water Process",
      icon: IconPath.tubewell,
      route: "/water-process",
    ),
  ].obs;
}
