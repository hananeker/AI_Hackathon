import 'package:beacon/Controllers/my_vouchers_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var isLoading = false.obs;
  var otp = ''.obs;
  late FocusNode boxFocus1, boxFocus2, boxFocus3, boxFocus4;
  late TextEditingController fieldOne, fieldTwo, fieldThree, fieldFour;
  late List<FocusNode> focus;
  late List<TextEditingController> controllers;
  final myVoucherController = Get.find<MyVoucherController>();
  var hasOtpError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fieldOne = TextEditingController();
    fieldTwo = TextEditingController();
    fieldThree = TextEditingController();
    fieldFour = TextEditingController();
    boxFocus1 = FocusNode();
    boxFocus2 = FocusNode();
    boxFocus3 = FocusNode();
    boxFocus4 = FocusNode();
    controllers = [
      fieldOne,
      fieldTwo,
      fieldThree,
      fieldFour,
    ];
    focus = [
      boxFocus1,
      boxFocus2,
      boxFocus3,
      boxFocus4,
    ];
  }

  @override
  void onClose() {
    boxFocus1.dispose();
    boxFocus2.dispose();
    boxFocus3.dispose();
    boxFocus4.dispose();
    fieldOne.dispose();
    fieldTwo.dispose();
    fieldThree.dispose();
    fieldFour.dispose();
    super.onClose();
  }

  voucherPasscode(String value, int index, int idVoucher) {
    if (value.length == 1) {
      Get.focusScope!.nextFocus();
    }
    if (index == 3) {
      for (TextEditingController c in controllers) {
        otp.value += c.text;
      }
      myVoucherController.useVoucher(idVoucher, otp.value);
      otp.value = '';
    }
  }

  pointRedeemPasscode(
    value,
    int index,
  ) {
    if ((controllers[index].text.length == 1) &
        (RegExp(r'\d+').hasMatch(controllers[index].text))) {
      Get.focusScope!.nextFocus();
    }
    if (index == 3) {
      for (TextEditingController c in controllers) {
        otp.value += c.text;
      }
      myVoucherController.redeemPoints(
          myVoucherController.requestedPoints.value,
          otp.value,
          myVoucherController.storecodeController.text);
    }
  }
}
