import 'package:doorway/res/routes/routes_name.dart';
import 'package:doorway/view/login_view.dart';
import 'package:doorway/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.loginView,
          page: () => const LoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
