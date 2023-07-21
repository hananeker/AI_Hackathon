import 'package:beacon/Models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void customSnackBar(ResponseModel response) {
  Get.snackbar(
    'title',
    'message',
    isDismissible: true,
    margin: EdgeInsets.only(
      bottom: 20.h,
    ),
    dismissDirection: DismissDirection.horizontal,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    barBlur: 10,
    borderWidth: 1.2,
    borderColor: Colors.grey,
    backgroundColor: Colors.black,
    titleText: Text(
      response.status,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
        fontFamily: 'Ubuntu',
      ),
    ),
    messageText: Text(
      response.message,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w200,
        fontSize: 14.sp,
        fontFamily: 'Ubuntu',
      ),
    ),
  );
}
