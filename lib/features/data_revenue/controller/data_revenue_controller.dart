import 'package:get/get.dart';
import '../model/data_cost_model.dart';

enum DataRevenueViewType { data, revenue }

class DataRevenueController extends GetxController {
  // View State
  final selectedView = DataRevenueViewType.data.obs;

  // UI State
  final isCustomDate = false.obs;
  final isExpanded = true.obs;

  // Metric
  final metricValue = 55.0.obs;
  final metricUnit = "kWh/Sqft".obs;

  // Data
  final dataCostList = <DataCostModel>[
    DataCostModel(
      label: "Data A",
      data: 2798.50,
      percentage: 29.53,
      cost: 35689,
    ),
    DataCostModel(
      label: "Data B",
      data: 72598.50,
      percentage: 35.39,
      cost: 525989,
    ),
    DataCostModel(
      label: "Data C",
      data: 6598.36,
      percentage: 83.90,
      cost: 5698756,
    ),
    DataCostModel(
      label: "Data D",
      data: 6598.26,
      percentage: 36.59,
      cost: 356987,
    ),
  ].obs;

  // Actions
  void toggleView(DataRevenueViewType type) {
    selectedView.value = type;

    if (type == DataRevenueViewType.data) {
      metricValue.value = 55.0;
      metricUnit.value = "kWh/Sqft";
    } else {
      metricValue.value = 8897455;
      metricUnit.value = "tk";
    }
  }

  void toggleExpand() {
    isExpanded.toggle();
  }
}
