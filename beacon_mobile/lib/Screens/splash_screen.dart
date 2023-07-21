import 'package:beacon/Controllers/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends GetView<InitialController> {
  SplashScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.find<InitialController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '[LOGO]',
              style: TextStyle(fontSize: 35.sp),
            ),
            ElevatedButton(
              onPressed: () => controller.redirectUser(),
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 26.w,
                    vertical: 26.h,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Getting Started',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 27.sp,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
