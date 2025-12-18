class DashboardFeatureModel {
  final String title;
  final String icon;
  final bool isEnabled;

  DashboardFeatureModel({
    required this.title,
    required this.icon,
    this.isEnabled = true,
  });
}
