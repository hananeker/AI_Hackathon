import 'package:beacon/Components/skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class StoreCardSkelton extends StatelessWidget {
  const StoreCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skelton(
            height: 90.h,
            width: 100.w,
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skelton(
                width: 100.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              Skelton(
                width: 200.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
