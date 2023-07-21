import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Controllers/login_controller.dart';
import 'package:beacon/Controllers/user_controller.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  final UserController userController = Get.find<UserController>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h), // Set this height
        child: const AppBarWidget(
          title: 'AppName',
          hasProfileIcon: false,
        ),
      ),
      body: Obx(() {
        if ((userController.isLoading.value) || (controller.isLoading.value)) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0x0fffffff),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Column(
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.sp,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                TextField(
                  controller: controller.emailController.value,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    errorText: controller.emailErrorText.value,
                    border: const OutlineInputBorder(),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Ubuntu',
                      fontStyle: FontStyle.normal,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: controller.pwdController.value,
                  obscureText: controller.isPasswordHidden.value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w400,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    errorText: controller.pwdErrorText.value,
                    border: const OutlineInputBorder(),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        (controller.isPasswordHidden.value)
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        controller.isPasswordHidden(
                            !controller.isPasswordHidden.value);
                      },
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                GestureDetector(
                  onTap: () => controller.login(),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "forgot password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w300),
                ),
                const Spacer(
                  flex: 2,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.signUpScreen),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
