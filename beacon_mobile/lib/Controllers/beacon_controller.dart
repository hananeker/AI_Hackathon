import 'package:beacon/Models/beacon_model.dart';
import 'package:beacon/Models/voucher_model.dart';
import 'package:beacon/Providers/offre_provider.dart';
import 'package:get/get.dart';

class BeaconController extends GetxController
    with StateMixin<List<BeaconModel>> {
  OffreProvider beaconProvider = OffreProvider();

  RxList beacons = [].obs;

  // void getAllVouchers() {
  //   voucherProvider.fetchAllVouchers().then((result) {
  //     List<VoucherModel> vouchers = result.body!;
  //     change(vouchers, status: RxStatus.success());
  //   }, onError: (err) {
  //     change(null, status: RxStatus.error(err.toString()));
  //   });

  void getAllBeacons() {
    beaconProvider.fetchAllBeaconsWithOffers().then((result) {
      //Fetch all beacon and associated vouchers from DB
      List<BeaconModel> b = result.body!;
      change(b, status: RxStatus.success());
    }, onError: (err) {});
  }

  @override
  void onInit() {
    // getAllVouchers();
    getAllBeacons();
    super.onInit();
  }
}
