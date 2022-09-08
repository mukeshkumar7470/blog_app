import 'package:get/instance_manager.dart';
import '../controllers/SignInController.dart';
import '../controllers/SplashController.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}