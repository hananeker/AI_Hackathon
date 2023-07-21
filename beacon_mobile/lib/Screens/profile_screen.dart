import 'package:beacon/Controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<UserController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 30.h,
        ),
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFFEFEFEF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                  size: 30.sp,
                )),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35.sp,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 15.h,
                right: 10.w,
                left: 10.w,
              ),
              height: 110.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.r),
                      ),
                    ),
                    child: Icon(
                      Icons.snowshoeing,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.sp,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                        child: Text(
                          "Manage your Phone Number,\nEmirates ID, email and more",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.sp,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.r),
                      ),
                    ),
                    child: Icon(
                      Icons.flag,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Addresses",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 50.sp,
            ),
            Container(
              padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00ABB9),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.r),
                      ),
                    ),
                    child: Icon(
                      Icons.lock,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Security",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.sp,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10.h,
                right: 10.w,
                left: 10.w,
              ),
              height: 50.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.h),
                      ),
                    ),
                    child: Icon(
                      Icons.notifications,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Notifications Settings",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10.h,
                right: 10.w,
                left: 10.w,
              ),
              height: 50.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0051AD),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.r),
                      ),
                    ),
                    child: Icon(
                      Icons.ac_unit_rounded,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10.h,
                right: 10.h,
                left: 10.w,
              ),
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.r),
                      ),
                    ),
                    child: Icon(
                      Icons.star,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Rate the app",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            //////////////////////////////////////////////////////////////////
            SizedBox(
              height: 60.h,
            ),
            GestureDetector(
              onTap: () async {
                await controller.logout();
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 120.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFA8AC),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25.r,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 23.sp,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
