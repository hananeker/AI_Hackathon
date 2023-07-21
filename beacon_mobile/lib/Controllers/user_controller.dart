import 'package:beacon/Components/custom_snackbar.dart';
import 'package:beacon/Models/response_model.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/Providers/offre_provider.dart';
import 'package:beacon/Providers/user_provider.dart';
import 'package:beacon/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  final UserProvider userProvider;
  final OffreProvider offreProvider = Get.put(OffreProvider());

  UserController({required this.userProvider});
  RxBool isLoading = false.obs;

  Future<bool> checkIfAuthenticated() async {
    isLoading(true);
    bool isAuthenticatedAndUserAvailable = false;
    final box = GetStorage();
    if (box.hasData('token')) {
      UserModel.token = box.read('token');
      userProvider.httpClient.addRequestModifier<dynamic>((request) {
        request.headers['Authorization'] = "Bearer ${UserModel.token}";
        return request;
      });
      offreProvider.httpClient.addRequestModifier<dynamic>((request) {
        request.headers['Authorization'] = "Bearer ${UserModel.token}";
        return request;
      });
      await userProvider.checkIfAuth().then((value) async {
        if (value.body != null) {
          if (value.body!) {
            final bool isUserAvailable = await getCurrentUser();
            isLoading(false);

            isAuthenticatedAndUserAvailable = isUserAvailable;
            print(
                "isAuthenticatedAndUserAvailable $isAuthenticatedAndUserAvailable");
          } else {
            isLoading(false);
            isAuthenticatedAndUserAvailable = false;
          }
        } else {
          isLoading(false);
          isAuthenticatedAndUserAvailable = false;
        }
      });
    } else {
      isLoading(false);
    }
    return isAuthenticatedAndUserAvailable;
  }

  logout() {
    userProvider.logout().then((result) {
      if ((result.body != null) && (result.statusCode == 200)) {
        ResponseModel response = result.body!;
        final box = GetStorage();
        if (box.hasData('token')) {
          box.write('token', '');
        }
        Get.offAllNamed(Routes.loginScreen);
        customSnackBar(response);
      }
    });
  }

  Future<bool> getCurrentUser() async {
    isLoading(true);
    bool isUserAvailable = await userProvider.getCurentUser().then((result) {
      if (result.body != null) {
        User u = User(
          email: result.body!.email,
          id: result.body!.id,
          gender: result.body!.gender,
          username: result.body!.username,
          points: result.body!.points,
          totalVouchers: result.body!.totalVouchers,
        );
        UserModel.user = u;
        // Get.offAndToNamed(Routes.homeScreen);
        print('user auth');
        return true;
      } else {
        return false;
      }
    });
    isLoading(false);
    return isUserAvailable;
  }
}
