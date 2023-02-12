import 'package:get/get.dart';
import 'package:tugas/pages/BottomBar.dart';
import 'package:tugas/pages/LoginScreen.dart';
import 'package:tugas/pages/OnboardScreen.dart';
import 'package:tugas/pages/SplashScreen.dart';
import 'package:tugas/routes/routename.dart';

class pageRouteApp {
  static final pages = [
    GetPage(
      name: RouteName.page_1,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteName.page_2,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.page_3,
      page: () => OnboardScreen(),
    ),
    GetPage(
      name: RouteName.page_4,
      page: () => BottomBar(),
    ),
  ];
}
