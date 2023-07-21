import 'package:beacon/Controllers/connectivity_controller.dart';
import 'package:beacon/Controllers/scan_controller.dart';
import 'package:beacon/constants.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<ConnectivityController> {
  BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);
  final int currentIndex;
  final scanController = Get.find<ScanController>();

  void onItemTapped(int index) {
    //When the offers is the current screen we must destroy it before going
    //to another screen in order to keep one instance of the offers screen
    //in stack to avoid duplicating the scanning process
    if (index == 0) {
      Get.toNamed(Routes.homeScreen);
    } else if (index == 1) {
      if (scanController.isOffersScreenActive.value) {
        Get.until(ModalRoute.withName(Routes.offersScreen));
      } else {
        Get.toNamed(Routes.offersScreen);
      }
    } else if (index == 2) {
      Get.toNamed(Routes.vouchersScreen);
    } else {
      Get.toNamed(Routes.settingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            padding: EdgeInsets.only(
                bottom: (controller.isStatusAppear.isTrue) ? 24.h : 0),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              items: items,
              selectedLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.sp,
                fontFamily: 'Ubuntu',
              ),
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey, fontSize: 18.sp),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              onTap: onItemTapped,
            ),
          ),
          // if (controller.isStatusAppear.isTrue)
          AnimatedContainer(
            height: (controller.isStatusAppear.isTrue) ? 24.h : 0,
            curve: Curves.easeInOut,
            width: 1.sw,
            color: (controller.hasConnection.value) ? Colors.green : Colors.red,
            padding: const EdgeInsets.all(5),
            duration: const Duration(milliseconds: 250),
            child: GestureDetector(
              onTap: () async {
                if (controller.hasConnection.isFalse) {
                  await controller.checkConnectionStatus();
                }
              },
              child: Text(
                (controller.hasConnection.value)
                    ? 'Back online'
                    : 'No connection, Tap to retry',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
