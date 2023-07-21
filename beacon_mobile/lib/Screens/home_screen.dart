import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Components/bottom_nav_bar.dart';
import 'package:beacon/Components/custom_snackbar.dart';
import 'package:beacon/Components/skelton.dart';
import 'package:beacon/Components/store_card.dart';
import 'package:beacon/Components/store_card_skelton.dart';
import 'package:beacon/Components/user_dashboard_card.dart';
import 'package:beacon/Controllers/home_controller.dart';
import 'package:beacon/Controllers/user_controller.dart';
import 'package:beacon/Models/response_model.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/constants.dart';
import 'package:beacon/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends GetView<UserController> {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h), // Set this height
        child: const AppBarWidget(
          title: 'AppName',
        ),
      ),
      body: Obx(() {
        // if ((controller.isLoading.value)) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Text(
                "Summary",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 10,
                    child: UserDashboardCard(
                      onTap: () => Get.toNamed(Routes.pointScreen),
                      label: 'Total Points',
                      value: UserModel.user!.points,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 10,
                    child: UserDashboardCard(
                      onTap: () => Get.toNamed(Routes.vouchersScreen),
                      label: 'Total Vouchers',
                      value: UserModel.user!.totalVouchers!,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.offersScreen);
                },
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Find near by offers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Text(
                "Featured",
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
            SizedBox(
              height: 120.h,
              child: (homeController.isAnnoncesLoaded.isFalse)
                  ? (homeController.annonces.isNotEmpty)
                      ? CarouselSlider(
                          items: List.generate(
                            homeController.annonces.length,
                            (index) => ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: SizedBox(
                                width: 1.sw,
                                child: CachedNetworkImage(
                                  // "https://image.shutterstock.com/image-vector/male-hand-holding-megaphone-important-260nw-1715477875.jpg",
                                  imageUrl:
                                      "$baseApiPictureUrl/${homeController.annonces[index].url}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          options: CarouselOptions(
                            padEnds: true,
                            autoPlayCurve: Curves.easeInOutCubic,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            height: 300.h,
                          ))
                      : const Center(
                          child: Text(
                            'There is no announcements',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.grey,
                            ),
                          ),
                        )
                  : Center(
                      child: Skelton(
                        height: 300.h,
                        width: 0.9.sw,
                      ),
                    ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Text(
                "Latest",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: (homeController.isStoresLoaded.isFalse)
                  ? (homeController.stores.isNotEmpty)
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: homeController.stores.length,
                            itemBuilder: (context, index) => StoreCard(
                              storeModel: homeController.stores[index],
                            ),
                          ),
                        )
                      : const Center(
                          child: Text(
                            'There is no stores',
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
                          StoreCardSkelton(),
                          StoreCardSkelton(),
                        ],
                      ),
                    ),
            ),
          ],
        );
      }),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
