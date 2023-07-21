import 'package:beacon/Components/app_bar_widget.dart';
import 'package:beacon/Controllers/signup_controller.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Enums/gender_enum.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);
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
        if ((controller.isLoading.value)) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Column(
            children: [
              const Spacer(
                flex: 4,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.sp,
                    fontFamily: "Ubuntu",
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              TextField(
                cursorColor: Colors.black,
                controller: controller.usernameController.value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Username",
                  errorText: controller.usernameErrorText.value,
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 20,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
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
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                ),
                controller: controller.emailController.value,
                decoration: InputDecoration(
                  errorText: controller.emailErrorText.value,
                  border: const OutlineInputBorder(),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w400,
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
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                ),
                controller: controller.pwdController.value,
                obscureText: controller.isPasswordHidden.value,
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
                      controller
                          .isPasswordHidden(!controller.isPasswordHidden.value);
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
                height: 20.h,
              ),
              Row(
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Radio(
                    value: controller.userGender.value,
                    groupValue: Gender.male,
                    activeColor: Colors.black,
                    splashRadius: 20.r,
                    onChanged: (value) => controller.userGender(Gender.male),
                  ),
                  const Text(
                    'male',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  Radio(
                    value: controller.userGender.value,
                    groupValue: Gender.female,
                    activeColor: Colors.black,
                    splashRadius: 20.r,
                    onChanged: (value) => controller.userGender(Gender.female),
                  ),
                  const Text(
                    'female',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 6,
              ),
              GestureDetector(
                onTap: () => controller.signUp(),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        );
      }),
    );
  }
}
