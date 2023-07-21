import 'package:beacon/Controllers/my_vouchers_controller.dart';
import 'package:beacon/Providers/offre_provider.dart';
import 'package:beacon/Providers/user_provider.dart';
import 'package:get/get.dart';

class MyVoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyVoucherController(
          offreProvider: Get.find<OffreProvider>(),
          userProvider: Get.find<UserProvider>(),
        ));
  }
}
