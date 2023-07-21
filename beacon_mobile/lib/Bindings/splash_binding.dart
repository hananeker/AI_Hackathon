import 'package:beacon/Controllers/initial_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController());
  }
}
