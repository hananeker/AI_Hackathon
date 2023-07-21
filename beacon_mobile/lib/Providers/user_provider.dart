import 'package:beacon/Models/beacon_model.dart';
import 'package:beacon/Models/response_model.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/constants.dart';
import 'package:get/get_connect/connect.dart';

class UserProvider extends GetConnect {
  Future<Response<List<BeaconModel>>> fetchAuthUser() =>
      get<List<BeaconModel>>('/beacon/all',
          decoder: (obj) => BeaconModel.listFromJson(obj));

  Future<Response<bool>> checkIfAuth() => get<bool>('/user', decoder: (obj) {
        if (obj['message'] != null) {
          if (obj['message'] == "Unauthenticated.") {
            return false;
          }
        }
        return true;
      });

  Future<Response<User>> getCurentUser() =>
      get<User>('/user', decoder: (obj) => User.fromJson(obj));

  Future<Response<ResponseModel>> logout() => post<ResponseModel>(
        '/user/logout',
        {},
        decoder: (obj) => ResponseModel.fromJson(obj),
        headers: {
          "Authorization": "Bearer ${UserModel.token}",
          "Accept": "application/json"
        },
      );

  @override
  void onInit() {
    httpClient.baseUrl = baseApiUrl;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers.addAll({"Accept": "application/json"});
      return request;
    });

    super.onInit();
  }
}
