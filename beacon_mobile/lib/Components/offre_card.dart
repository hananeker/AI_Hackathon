import 'package:beacon/Models/offre_model.dart';
import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Models/voucher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:intl/intl.dart';

class OffreCard extends StatelessWidget {
  const OffreCard({
    Key? key,
    required this.offre,
    this.onPressed,
    this.isOffreUsed = false,
  }) : super(key: key);
  final OffreModel offre;
  final bool isOffreUsed;
  final Callback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 340.w,
        margin: EdgeInsets.only(
          bottom: 10.h,
        ),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(
            color: (isOffreUsed) ? Colors.black38 : Colors.black,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(3.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (offre is VoucherModel)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offre.storeName,
                    style: TextStyle(
                        color: (isOffreUsed) ? Colors.black38 : Colors.black,
                        fontSize: 23.sp,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    offre.description,
                    style: TextStyle(
                      color: (isOffreUsed) ? Colors.black38 : Colors.black,
                      fontSize: 20.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isOffreUsed)
                    Text(
                      'Reference: ${(offre as VoucherModel).ref}',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 15.sp,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w500),
                    ),
                  if (isOffreUsed)
                    Text(
                      'Date: ${DateFormat('yyyy-MM-dd').format((offre as VoucherModel).usedAt!)}',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 15.sp,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            if (offre is PointOffreModel)
              Text(
                "+${(offre as PointOffreModel).points.toString()} Points",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 23.sp,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (onPressed != null)
              IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.arrow_circle_right_sharp,
                    size: 30.sp,
                  ))
          ],
        ),
      ),
    );
  }
}
