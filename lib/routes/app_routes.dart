import 'package:get/get.dart';
import 'package:scube/features/authentication/login/view/login_view.dart';
import 'package:scube/features/category_details/screen/category_details_screen.dart';
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
      page: () => const CategoryDetailScreen(),
    ),
    // GetPage(name: homeScreen, page: () => const HomeScreen()),
  ];
}
