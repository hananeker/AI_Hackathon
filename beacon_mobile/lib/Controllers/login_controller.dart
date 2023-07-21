import 'dart:convert';

import 'package:beacon/Controllers/user_controller.dart';

import 'package:beacon/Models/user_model.dart';
import 'package:beacon/constants.dart';
import 'package:beacon/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController().obs;
  var pwdController = TextEditingController().obs;

  final box = GetStorage();
  RxBool isLoading = false.obs;
  RxBool isPasswordHidden = false.obs;

  final UserController userController = Get.find<UserController>();
  Rx<String?> errorErrorText = null.obs;
  Rx<String?> usernameErrorText = null.obs;
  Rx<String?> emailErrorText = null.obs;
  Rx<String?> pwdErrorText = null.obs;

  login() async {
    print('$baseApiUrl/user/login');
    try {
      var response = await post(Uri.parse('$baseApiUrl/user/login'), body: {
        'email': emailController.value.text,
        'password': pwdController.value.text,
      });

      var json = jsonDecode(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        UserModel.user = User.fromJson(json['user']);
        UserModel.token = json['token'];

        box.write('token', UserModel.token);

        isLoading.value = false;
        Get.offAllNamed(Routes.homeScreen);
      } else {
        errorErrorText = Rx<String?>(json['message']);
        emailErrorText = Rx<String?>(json['email'].toString());
        pwdErrorText = Rx<String?>(json['password'].toString());
        isLoading.refresh();
      }
    } finally {
      // TODO
    }
  }

  @override
  void onClose() {
    emailErrorText(null);
    pwdErrorText(null);
    emailController.value.dispose();
    pwdController.value.dispose();
    super.onClose();
  }
}
