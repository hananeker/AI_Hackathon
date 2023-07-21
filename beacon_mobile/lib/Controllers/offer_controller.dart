import 'package:beacon/Components/custom_snackbar.dart';
import 'package:beacon/Controllers/scan_controller.dart';
import 'package:beacon/Models/beacon_model.dart';
import 'package:beacon/Models/offre_model.dart';
import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Models/response_model.dart';
import 'package:beacon/Models/voucher_model.dart';
import 'package:beacon/Providers/offre_provider.dart';
import 'package:beacon/Providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  final OffreProvider offreProvider;
  final UserProvider userProvider;

  OfferController({required this.offreProvider, required this.userProvider});
  ScanController scanController = Get.find<ScanController>();

  RxList beacons = [].obs;

  var myOffers = <OffreModel>[].obs;
  var usedOffers = <OffreModel>[].obs;

  void getAllBeacons() {
    offreProvider.fetchAllBeaconsWithOffers().then((result) {
      beacons.value = result.body!;
    }, onError: (err) {});
  }

  takePointOffer(int idPointOffre) async {
    offreProvider.takePointOffer(idPointOffre).then((result) {
      ResponseModel response = result.body!;
      customSnackBar(response);
      if (result.statusCode == 200) {
        scanController.refreshScanning();

        // scanController.stopScanBeacon();
        // for (BeaconModel beaconModel in scanController.bs) {
        //   beaconModel.offers.removeWhere((element) =>
        //       ((element is PointOffreModel) && (element.id == idPointOffre)));
        // }
        // scanController.availableOffers.removeWhere((element) {
        //   if ((element is PointOffreModel) && (element.id == idPointOffre)) {
        //     myOffers.add(element);
        //     return true;
        //   }
        //   return false;
        // });
        // scanController.bs.refresh();
        // scanController.availableOffers.refresh();
        // scanController.resumeScanBeacon();
      }
    });
  }

  takeVoucher(int idVoucher) async {
    offreProvider.takeVoucher(idVoucher).then((result) {
      ResponseModel response = result.body!;
      customSnackBar(response);
      if (result.statusCode == 200) {
        scanController.refreshScanning();

        // scanController.stopScanBeacon();
        // for (BeaconModel beaconModel in scanController.bs) {
        //   beaconModel.offers.removeWhere((element) =>
        //       ((element is VoucherModel) && (element.id == idVoucher)));
        // }
        // scanController.availableOffers.removeWhere((element) {
        //   if ((element is VoucherModel) && (element.id == idVoucher)) {
        //     myOffers.add(element);
        //     return true;
        //   }
        //   return false;
        // });
        // scanController.bs.refresh();
        // scanController.availableOffers.refresh();
        // scanController.resumeScanBeacon();
      }
    });
  }

  @override
  void onInit() {
    getAllBeacons();
    super.onInit();
  }
}
