import 'package:beacon/Controllers/user_controller.dart';
import 'package:beacon/Providers/offre_provider.dart';
import 'package:beacon/Providers/user_provider.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UserProvider(),
    );
    Get.lazyPut(
      () => OffreProvider(),
    );
    Get.lazyPut(
      () => UserController(
        userProvider: Get.find<UserProvider>(),
      ),
      fenix: true,
    );
  }
}
