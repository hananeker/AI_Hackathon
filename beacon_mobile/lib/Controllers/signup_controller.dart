import 'dart:convert';

import 'package:beacon/Controllers/user_controller.dart';
import 'package:beacon/Enums/gender_enum.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/constants.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class SignUpController extends GetxController {
  var usernameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var pwdController = TextEditingController().obs;

  var userGender = Gender.male.obs;
  final box = GetStorage();
  RxBool isLoading = false.obs;
  RxBool isPasswordHidden = false.obs;

  final UserController userController = Get.find<UserController>();
  // ignore: unnecessary_cast
  Rx<String?> errorErrorText = null.obs;
  Rx<String?> usernameErrorText = null.obs;
  Rx<String?> emailErrorText = null.obs;
  Rx<String?> pwdErrorText = null.obs;

  signUp() async {
    try {
      User user = User(
          email: emailController.value.text,
          gender: userGender.value.toString().split('.')[1],
          username: usernameController.value.text,
          password: pwdController.value.text,
          points: 0);

      var response = await post(Uri.parse('$baseApiUrl/user/register'),
          body: user.toJson());

      var json = jsonDecode(response.body);
      // print(json);
      if (response.statusCode == 201) {
        UserModel.user = User.fromJson(json['user']);
        UserModel.token = json['token'];
        box.write('token', UserModel.token);
        emailController.value.clear();
        usernameController.value.clear();
        pwdController.value.clear();
        isLoading.value = false;
        Get.offAllNamed(Routes.homeScreen);
      } else {
        if (json['message'] != null) {
          errorErrorText = Rx<String?>(json['message']);
        }
        if (json['name'] != null) {
          usernameErrorText = Rx<String?>(json['name'].first);
        }
        if (json['email'] != null) {
          emailErrorText = Rx<String?>(json['email'].first);
        }
        if (json['password'] != null) {
          pwdErrorText = Rx<String?>(json['password'].first);
        }
        isLoading.refresh();
      }
    } finally {
      // TODO
    }
  }

  @override
  void onClose() {
    usernameErrorText(null);
    emailErrorText(null);
    pwdErrorText(null);
    emailController.value.dispose();
    pwdController.value.dispose();
    usernameController.value.dispose();
    super.onClose();
  }
}
