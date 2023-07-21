import 'package:beacon/Controllers/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NeedPermissionScreen extends GetView<ScanController> {
  const NeedPermissionScreen({Key? key}) : super(key: key);

  String getMessage() {
    int index = 0;
    if (controller.bluetoothEnabled.isFalse) {
      index += 1;
    }
    if (controller.locationServiceEnabled.isFalse) {
      index += 2;
    }
    if (controller.authorizationStatusOk.isFalse) {
      index += 4;
    }

    List<String> messages = [
      '', //  000
      'Enable your blutooth', // 001
      'Enable your location', // 010
      'Enable your blutooth and location', // 011
      'Permit access to location', // 100
      'Permit access to location and enable bluetooth', // 101
      'Authorize and enable location', // 110
      'This app need access to blutooth and location', // 111
    ];
    return messages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 1.sh,
        width: 1.sw,
        color: const Color(0x0fffffff),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!controller.bluetoothEnabled.value)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Icon(
                        Icons.bluetooth_audio_outlined,
                        size: 230.sp,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                if ((!(controller.locationServiceEnabled.value) ||
                    !(controller.authorizationStatusOk.value)))
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                      ),
                      child: Icon(
                        Icons.location_on,
                        size: 230.sp,
                        color: Colors.black12,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              getMessage(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.sp,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "To find valuable prizes!",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24.sp,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    });
  }
}
