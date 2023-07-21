import 'package:beacon/Controllers/login_controller.dart';
import 'package:beacon/Controllers/beacon_controller.dart';
import 'package:beacon/Controllers/connectivity_controller.dart';
import 'package:beacon/Controllers/my_vouchers_controller.dart';
import 'package:beacon/Controllers/offer_controller.dart';
import 'package:beacon/Controllers/otp_controller.dart';
import 'package:beacon/Controllers/scan_controller.dart';
import 'package:beacon/Controllers/user_controller.dart';
import 'package:beacon/Providers/offre_provider.dart';
import 'package:beacon/Providers/user_provider.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UserProvider(),
      fenix: true,
    );
    Get.lazyPut(
      () => OffreProvider(),
      fenix: true,
    );
    Get.lazyPut(
      () => UserController(
        userProvider: Get.find<UserProvider>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ScanController(
        offreProvider: Get.find<OffreProvider>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ConnectivityController(),
      fenix: true,
    );
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => BeaconController(), fenix: true);
    // Get.lazyPut(
    //   () => LoginController(),
    // );
    Get.lazyPut(() => OfferController(
          offreProvider: Get.find<OffreProvider>(),
          userProvider: Get.find<UserProvider>(),
        ));
    Get.put(
      () => MyVoucherController(
        offreProvider: Get.find<OffreProvider>(),
        userProvider: Get.find<UserProvider>(),
      ),
      permanent: true,
    );
  }
}
