import 'package:get/instance_manager.dart';
import '../controllers/SignInController.dart';
import '../controllers/SignupController.dart';
import '../controllers/SplashController.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}