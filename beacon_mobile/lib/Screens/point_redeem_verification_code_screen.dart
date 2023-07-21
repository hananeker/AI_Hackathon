import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Components/bottom_nav_bar.dart';
import 'package:beacon/Components/button.dart';
import 'package:beacon/Components/otp_input.dart';
import 'package:beacon/Controllers/my_vouchers_controller.dart';
import 'package:beacon/Controllers/offer_controller.dart';
import 'package:beacon/Controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PointRedeemVerificationCodeScreen extends GetView<MyVoucherController> {
  PointRedeemVerificationCodeScreen({Key? key}) : super(key: key);
  final int idVoucher = 1;
  final otpController = Get.find<OtpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h), // Set this height
        child: const AppBarWidget(
          title: 'My Vouchers',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0x0fffffff),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 140.w),
              child: Text(
                "Enter Shop Voucher passcode",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Obx(() {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: TextField(
                    controller: controller.storecodeController,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ubuntu',
                      fontSize: 20.sp,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Store code',
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.r,
                            ),
                            borderSide: BorderSide(
                              color: (!otpController.hasOtpError.value)
                                  ? Colors.black
                                  : Colors.red,
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.r,
                            ),
                            borderSide: BorderSide(
                              color: (!otpController.hasOtpError.value)
                                  ? Colors.black
                                  : Colors.red,
                              width: 2.w,
                            )),
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                        )),
                  ));
            }),
            SizedBox(
              height: 25.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: OtpInput(
                  idVoucher: idVoucher,
                  isVoucherPasscode: false,
                )),
            SizedBox(
              height: 25.h,
            ),
            Button(
              label: 'Redeem',
              onPressed: () {
                controller.redeemPoints(
                    controller.requestedPoints.value,
                    otpController.otp.value,
                    controller.storecodeController.text);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}
