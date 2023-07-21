import 'package:beacon/Models/point_record_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PointRecordCard extends StatelessWidget {
  const PointRecordCard({Key? key, required this.pointRecord})
      : super(key: key);
  final PointRecordModel pointRecord;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.h,
      ),
      margin: EdgeInsets.only(
        bottom: 5.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (pointRecord.operation == "collect")
            Text(
              '+${pointRecord.points}',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.sp,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600),
            ),
          if (pointRecord.operation == "withdraw")
            Text(
              '-${pointRecord.points}',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.sp,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w600,
              ),
            ),
          Text(
            DateFormat('yyyy-MM-dd').format(pointRecord.date),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
