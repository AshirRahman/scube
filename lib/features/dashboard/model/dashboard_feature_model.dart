class DashboardFeatureModel {
  final String title;
  final String icon;
  final String route;
  final bool isEnabled;

  DashboardFeatureModel({
    required this.title,
    required this.icon,
    required this.route,
    this.isEnabled = true,
  });
}
