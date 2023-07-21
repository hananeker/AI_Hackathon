import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class UserDashboardCard extends StatelessWidget {
  const UserDashboardCard({
    Key? key,
    required this.label,
    required this.value,
    this.onTap,
  }) : super(key: key);

  final int value;
  final String label;
  final Callback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 12,
        ),
        decoration: const BoxDecoration(
            color: Color(0xFFE9E9E9),
            borderRadius: BorderRadius.all(Radius.circular(35))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "$value",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.sp,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
