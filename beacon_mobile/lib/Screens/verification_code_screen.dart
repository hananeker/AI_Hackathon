import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Components/bottom_nav_bar.dart';
import 'package:beacon/Components/otp_input.dart';
import 'package:beacon/Controllers/offer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerificationCodeScreen extends GetView<OfferController> {
  VerificationCodeScreen({Key? key}) : super(key: key);
  final int idVoucher = Get.arguments;
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
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: OtpInput(
                  idVoucher: idVoucher,
                  isVoucherPasscode: true,
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}
