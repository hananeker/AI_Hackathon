import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Callback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.sp,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
