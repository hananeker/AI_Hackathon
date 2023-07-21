import 'package:beacon/Components/custom_snackbar.dart';
import 'package:beacon/Controllers/connectivity_controller.dart';
import 'package:beacon/Controllers/otp_controller.dart';
import 'package:beacon/Controllers/scan_controller.dart';
import 'package:beacon/Controllers/user_controller.dart';
import 'package:beacon/Models/beacon_model.dart';
import 'package:beacon/Models/offre_model.dart';
import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Models/point_record_model.dart';
import 'package:beacon/Models/response_model.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/Models/voucher_model.dart';
import 'package:beacon/Providers/offre_provider.dart';
import 'package:beacon/Providers/user_provider.dart';
import 'package:beacon/Screens/points_screen.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyVoucherController extends GetxController {
  OffreProvider offreProvider;
  UserProvider userProvider;
  MyVoucherController({
    required this.offreProvider,
    required this.userProvider,
  });
  RxBool isLoading = false.obs;
  RxInt requestedPoints = 0.obs;
  TextEditingController storecodeController = TextEditingController();
  ScanController scanController = Get.find<ScanController>();
  ConnectivityController connectivityController =
      Get.find<ConnectivityController>();

  var myVouchers = <VoucherModel>[].obs;
  var usedVouchers = <VoucherModel>[].obs;
  var lastPointsRecord = <PointRecordModel>[].obs;

  getMyVouchers() async {
    isLoading(true);
    await offreProvider.fetchMyVouchers().then((result) {
      if (result.body != null) {
        myVouchers.value = result.body!;
        UserModel.user!.totalVouchers = myVouchers.length;
      }
    });
    isLoading(false);
  }

  getUsedVouchers() async {
    isLoading(true);
    await offreProvider.fetchUsedVouchers().then((result) {
      if (result.body != null) {
        usedVouchers.value = result.body!;
      }
    });
    isLoading(false);
  }

  takeVoucher(int idVoucher) async {
    isLoading(true);
    await offreProvider.takeVoucher(idVoucher).then((result) {
      if (result.body != null) {
        ResponseModel response = result.body!;
        customSnackBar(response);
        if (result.statusCode == 200) {
          getMyVouchers();
          scanController.refreshScanning();
        }
      }
    });
    isLoading(false);
  }

  useVoucher(int idVoucher, String passcode) async {
    isLoading(true);
    await offreProvider.useVoucher(idVoucher, passcode).then((result) {
      if (result.body != null) {
        ResponseModel response = result.body!;
        customSnackBar(response);
        final otpController = Get.find<OtpController>();

        if (result.statusCode == 200) {
          for (VoucherModel voucher in myVouchers) {
            if (voucher.id == idVoucher) {
              myVouchers.remove(voucher);
              break;
            }
          }
          otpController.hasOtpError(false);
          Get.offAndToNamed(Routes.refCodescreen, arguments: response.ref);
          getUsedVouchers();
        } else {
          otpController.hasOtpError(true);
        }
      }
    });
    isLoading(false);
  }

  redeemPoints(int points, String passcode, String storecode) async {
    isLoading(true);
    await offreProvider
        .redeemPoints(passcode, points, storecode)
        .then((result) async {
      if (result.body != null) {
        ResponseModel response = result.body!;
        customSnackBar(response);
        requestedPoints(0);
        final otpController = Get.find<OtpController>();

        if (result.statusCode == 200) {
          otpController.hasOtpError(false);
          otpController.otp('');
          storecodeController.clear();
          UserModel.user!.points = UserModel.user!.points - points;
          await fetchPointRecords();
          Get.offAndToNamed(Routes.refCodescreen, arguments: response.ref);
        } else {
          otpController.hasOtpError(true);
        }
      }
    });
    isLoading(false);
  }

  takePointOffer(int idPointOffer) async {
    isLoading(true);
    await offreProvider.takePointOffer(idPointOffer).then((result) async {
      if (result.body != null) {
        ResponseModel response = result.body!;
        customSnackBar(response);
        scanController.removePointOffre(idPointOffer);
        await scanController.refreshScanning();
      }
    });
    isLoading(false);
  }

  fetchPointRecords() async {
    isLoading(true);
    await offreProvider.fetchPointsRecords().then((result) {
      if (result.body != null) {
        lastPointsRecord.value = result.body!;
        lastPointsRecord.sort(((a, b) => b.date.compareTo(a.date)));
      }
    });
    isLoading(false);
  }

  VoucherModel? getVoucherById(int idVoucher) {
    for (BeaconModel bc in scanController.bs) {
      for (OffreModel of in bc.offers) {
        if ((of is VoucherModel) && (of.id == idVoucher)) {
          return of;
        }
      }
    }
    return null;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getMyVouchers();
    await getUsedVouchers();
    await fetchPointRecords();
  }
}
