import 'package:get/get.dart';
import 'package:scube/features/authentication/login/view/login_view.dart';
import 'package:scube/features/category_details/View/category_details_view.dart';
// import '../features/home/screen/home_screen.dart';

class AppRoute {
  static String loginView = "/loginView";
  static String homeScreen = "/homeScreen";
  static String featureDetailsScreen = "/featureDetailsScreen";

  static String getLoginView() => loginView;
  static String getHomeScreen() => homeScreen;
  static String getFeatureDetailsScreen() => featureDetailsScreen;

  static List<GetPage> routes = [
    GetPage(
      name: loginView,
      page: () => LoginView(),
    ),
    GetPage(
      name: featureDetailsScreen,
      page: () => const CategoryDetailView(),
    ),
    // GetPage(name: homeScreen, page: () => const HomeScreen()),
  ];
}
