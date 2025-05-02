import 'package:get/get.dart';


import '../BnApp/DashBoard/DashBoard_Screen.dart';
import '../BnApp/LoginService/login_Screen.dart';

import '../Splash/splash_screen.dart';
import 'Bn_AppRoutes.dart';

class AppPages {
  static const initialRoutes = AppRoutes.login;
  static final routes = [
    GetPage(
      name: initialRoutes,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
    ),
    /*GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      // binding: ModuleFeatureBindings(),
    ),*/
  ];
}
