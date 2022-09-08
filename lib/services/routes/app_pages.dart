import 'package:blog_app/bindings/SplashBinding.dart';
import 'package:blog_app/views/widgets/add_blog_screen.dart';
import 'package:get/get.dart';

import '../../bindings/DashboardBinding.dart';
import '../../bindings/SignInBinding.dart';
import '../../bindings/SignupBinding.dart';
import '../../views/dashboard_screen.dart';
import '../../views/signin_screen.dart';
import '../../views/signup_screen.dart';
import '../../views/splash_screen.dart';
import '../../views/bottom_navbar_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNavbar,
      page: () => const BottomNavbarScreen(),
    ),
    GetPage(
      name: AppRoutes.addBlog,
      page: () => const AddBlogScreen(),
    ),
  ];
}