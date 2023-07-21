import 'package:beacon/Controllers/connectivity_controller.dart';
import 'package:get/get.dart';

class ConnectivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectivityController(), fenix: true);
  }
}
