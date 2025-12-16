import 'package:get/get.dart';
import 'package:scube/features/authentication/login/view/login_view.dart';
import 'package:scube/features/feature_details/screen/feature_detail_screen.dart';
// import '../features/home/screen/home_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String homeScreen = "/homeScreen";
  static String featureDetailsScreen = "/featureDetailsScreen";

  static String getLoginScreen() => loginScreen;
  static String getHomeScreen() => homeScreen;
  static String getFeatureDetailsScreen() => featureDetailsScreen;

  static List<GetPage> routes = [
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: featureDetailsScreen,
      page: () => FeatureDetailScreen(),
    ),
    // GetPage(name: homeScreen, page: () => const HomeScreen()),
  ];
}
