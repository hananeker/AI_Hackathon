import 'package:beacon/Controllers/information_screen_controller.dart';
import 'package:beacon/routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InformationsScreen extends GetView<InfoScreenController> {
  const InformationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CarouselSlider(
            carouselController: controller.carouselController,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onScrolled: (value) => controller.onScrolled(value),
              height: 550.h,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return const InfoCard();
                },
              );
            }).toList(),
          ),
          Obx(() {
            return DotsIndicator(
              dotsCount: 5,
              position: controller.scrollValue.value,
              decorator: DotsDecorator(
                activeColor: Colors.black,
                color: Colors.transparent,
                shape: const CircleBorder(
                    side: BorderSide(
                  color: Colors.black,
                  width: 2,
                )),
                size: Size.square(17.0.w),
                activeSize: Size(36.0.w, 17.0.h),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r)),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE424),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: GestureDetector(
        onTap: () => Get.offAndToNamed(Routes.loginScreen),
        child: Center(
          child: Text(
            "COND1",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.sp,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
