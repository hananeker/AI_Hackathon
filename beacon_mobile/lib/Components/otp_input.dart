import 'package:beacon/Controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpInput extends GetWidget<OtpController> {
  OtpInput({Key? key, required this.idVoucher, required this.isVoucherPasscode})
      : super(key: key);
  final color = Colors.black;
  final int idVoucher;
  final bool isVoucherPasscode;
  @override
  final OtpController controller = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => SizedBox(
              height: 60.h,
              width: 50.w,
              child: TextFormField(
                  autofocus: (index == 0),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: controller.controllers[index],
                  maxLength: 1,
                  focusNode: controller.focus[index],
                  style: TextStyle(
                    color: color,
                    fontSize: 20.sp,
                  ),
                  cursorColor: color,
                  decoration: InputDecoration(
                      // errorText: (controller.hasOtpError.value) ? '' : null,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: (controller.hasOtpError.value)
                              ? Colors.red
                              : color,
                          // width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: (controller.hasOtpError.value)
                              ? Colors.red
                              : color,
                          width: 3,
                        ),
                      ),
                      counterText: '',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                      )),
                  onTap: () {
                    controller.controllers[index].clear();
                  },
                  onChanged: (value) {
                    if (isVoucherPasscode) {
                      controller.voucherPasscode(value, index, idVoucher);
                    } else {
                      controller.pointRedeemPasscode(value, index);
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
