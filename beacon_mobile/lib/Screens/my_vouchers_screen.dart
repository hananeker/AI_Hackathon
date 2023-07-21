import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Components/bottom_nav_bar.dart';
import 'package:beacon/Components/offre_card.dart';
import 'package:beacon/Components/skelton.dart';
import 'package:beacon/Components/used_voucher_card_skelton.dart';
import 'package:beacon/Components/voucher_card_skelton.dart';
import 'package:beacon/Controllers/my_vouchers_controller.dart';
import 'package:beacon/Models/voucher_model.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VouchersScreen extends GetView<MyVoucherController> {
  const VouchersScreen({Key? key}) : super(key: key);

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
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
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
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "My Vouchers",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            // controller.obx(
            //   (state) => Column(
            //     children: List.generate(
            //         state!.length,
            //         (index) => OffreCard(
            //               offre: state[index],
            //             )),
            //   ),
            //   onLoading: const CircularProgressIndicator(),
            //   onError: (err) => Text(
            //     err ?? 'Error',
            //     style: const TextStyle(
            //       color: Colors.red,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            // Column(
            //   children: const [
            //     OffersCard(
            //       point: false,
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     OffersCard(
            //       point: false,
            //     ),
            //   ],
            // ),
            Obx(() {
              return Expanded(
                child: (controller.isLoading.isFalse)
                    ? (controller.myVouchers.isNotEmpty)
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.myVouchers.length,
                            itemBuilder: (context, index) => OffreCard(
                              offre: controller.myVouchers[index],
                              onPressed: () => Get.toNamed(
                                  Routes.voucherDetailsScreen,
                                  arguments: controller.myVouchers[index]),
                            ),
                          )
                        : const Center(
                            child: Text(
                              'There is no saved vouchers',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.grey,
                              ),
                            ),
                          )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                            children: List.generate(
                          3,
                          (index) => const VoucherSkeltonCard(),
                        )),
                      ),
              );
            }),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "Used Vouchers",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(() {
              return Expanded(
                child: (controller.isLoading.isFalse)
                    ? (controller.usedVouchers.isNotEmpty)
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.usedVouchers.length,
                            itemBuilder: (context, index) => OffreCard(
                              offre: controller.usedVouchers[index],
                              isOffreUsed: true,
                            ),
                          )
                        : const Center(
                            child: Text(
                              'There is no used vouchers',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.grey,
                              ),
                            ),
                          )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: const [
                            UsedVoucherSkeltonCard(),
                            UsedVoucherSkeltonCard(),
                          ],
                        ),
                      ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
