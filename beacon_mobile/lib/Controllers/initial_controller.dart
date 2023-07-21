import 'package:beacon/Controllers/user_controller.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  final box = GetStorage();
  final bool isFirstTime = !GetStorage().hasData('token');
  String nextRoute = '';

  Future<String> getNextScreen() async {
    if (isFirstTime) {
      return Routes.infoScreen;
    } else {
      final bool isAuth =
          await Get.find<UserController>().checkIfAuthenticated();
      print(isAuth);
      if (isAuth) {
        return Routes.homeScreen;
      } else {
        return Routes.loginScreen;
      }
    }
  }

  void redirectUser() {
    if (nextRoute.isNotEmpty) {
      Get.offAndToNamed(nextRoute);
    }
  }

  @override
  Future<void> onInit() async {
    nextRoute = await getNextScreen();

    super.onInit();
  }
}
