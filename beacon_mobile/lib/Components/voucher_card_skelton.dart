import 'package:beacon/Components/skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoucherSkeltonCard extends StatelessWidget {
  const VoucherSkeltonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skelton(
            width: 90.w,
          ),
          SizedBox(
            height: 15.h,
          ),
          Skelton(
            width: 190.w,
          ),
        ],
      ),
    );
  }
}
