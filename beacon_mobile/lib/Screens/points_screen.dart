import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Components/bottom_nav_bar.dart';
import 'package:beacon/Components/button.dart';
import 'package:beacon/Components/point_record_card.dart';
import 'package:beacon/Components/skelton.dart';
import 'package:beacon/Controllers/my_vouchers_controller.dart';
import 'package:beacon/Controllers/user_controller.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PointsScreen extends GetView<MyVoucherController> {
  PointsScreen({Key? key}) : super(key: key);
  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.h), // Set this height
          child: const AppBarWidget(
            title: 'Points',
          ),
        ),
        body: Obx(() {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 25.w,
            ),
            height: double.infinity,
            width: double.infinity,
            color: const Color(0x0fffffff),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    "Total Points",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 80.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9E9E9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.r),
                    ),
                  ),
                  child: Text(
                    "${UserModel.user!.points}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Slider(
                  value: controller.requestedPoints.value.toDouble(),
                  max: UserModel.user!.points.toDouble(),
                  divisions: 100,
                  min: 0,
                  thumbColor: Colors.black,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black12,
                  label: controller.requestedPoints.value.toString(),
                  onChanged: (double value) =>
                      controller.requestedPoints(value.round()),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 15,
                      child: Container(
                        height: 60.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: 3.w,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.r),
                          ),
                        ),
                        child: Text(
                          "${controller.requestedPoints.value}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30.sp,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 8,
                      child: Button(
                        label: "Redeem",
                        onPressed: () {
                          Get.toNamed(Routes.pointRedeemScreen);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last Points Record",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Lasts 6 months",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: (controller.isLoading.isFalse)
                      ? (controller.lastPointsRecord.isNotEmpty)
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.lastPointsRecord.length,
                              itemBuilder: (context, index) => PointRecordCard(
                                pointRecord: controller.lastPointsRecord[index],
                              ),
                            )
                          : const Center(
                              child: Text(
                                'There is no points records',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.grey,
                                ),
                              ),
                            )
                      : SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              3,
                              (index) => const PointRecordSkeltonCard(),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 0,
        ));
  }
}

class PointRecordSkeltonCard extends StatelessWidget {
  const PointRecordSkeltonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.h,
      ),
      margin: EdgeInsets.only(
        bottom: 5.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.black.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Skelton(
            width: 60.w,
            height: 20.h,
          ),
          Skelton(
            width: 120.w,
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
