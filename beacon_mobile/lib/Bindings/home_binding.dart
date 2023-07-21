import 'package:beacon/Controllers/home_controller.dart';
import 'package:beacon/Providers/home_provider.dart';
import 'package:get/get.dart';

class AnnonceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeProvider());
    Get.lazyPut(() => HomeController(homeProvider: Get.find<HomeProvider>()));
  }
}
