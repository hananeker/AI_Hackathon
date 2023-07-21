import 'package:beacon/Controllers/login_controller.dart';
import 'package:beacon/Controllers/information_screen_controller.dart';
import 'package:get/get.dart';

class InfoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InfoScreenController(),
    );
  }
}
