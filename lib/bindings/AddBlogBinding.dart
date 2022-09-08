import 'package:blog_app/controllers/AddBlogController.dart';
import 'package:get/instance_manager.dart';
import '../controllers/SplashController.dart';

class AddBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddBlogController());
  }
}