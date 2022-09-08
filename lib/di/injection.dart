import 'package:blog_app/bindings/SignInBinding.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../bindings/AddBlogBinding.dart';
import '../bindings/DashboardBinding.dart';
import '../bindings/SignupBinding.dart';
import '../bindings/SplashBinding.dart';
import '../core/utils/constants.dart';

class DependencyInjector {
  static void inject() {
    _injectExternalDependencies();

    SplashBinding().dependencies();
    SignInBinding().dependencies();
    SignupBinding().dependencies();
    DashboardBinding().dependencies();
    AddBlogBinding().dependencies();
  }

  static void _injectExternalDependencies() {
    final dio = Dio(
      BaseOptions(baseUrl: ApiEndpoints.baseURL),
    );
    Get.lazyPut<Dio>(() => dio);
  }
}
