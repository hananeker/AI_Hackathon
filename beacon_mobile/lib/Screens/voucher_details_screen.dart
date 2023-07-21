import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Components/bottom_nav_bar.dart';
import 'package:beacon/Components/button.dart';
import 'package:beacon/Components/offre_card.dart';
import 'package:beacon/Controllers/offer_controller.dart';
import 'package:beacon/Models/voucher_model.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VoucherDetailsScreen extends GetView<OfferController> {
  VoucherDetailsScreen({
    Key? key,
  }) : super(key: key);
  final VoucherModel voucher = Get.arguments;

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
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 20.h,
          ),
          height: double.infinity,
          width: double.infinity,
          color: const Color(0x0fffffff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "My Vouchers",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              OffreCard(
                offre: voucher,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Terms and Conditions",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                flex: 6,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      width: 1.sw,
                      child: Text(
                        voucher.terms,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Center(
                child: Button(
                  label: "Use this voucher",
                  onPressed: () {
                    Get.offAndToNamed(
                      Routes.voucherCodecreen,
                      arguments: voucher.id,
                    );
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 2,
        ));
  }
}
