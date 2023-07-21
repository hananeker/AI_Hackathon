import 'package:beacon/Models/annonce_model.dart';
import 'package:beacon/Models/beacon_model.dart';
import 'package:beacon/Models/response_model.dart';
import 'package:beacon/Models/store_model.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/constants.dart';
import 'package:get/get_connect/connect.dart';

class HomeProvider extends GetConnect {
  Future<Response<List<AnnonceModel>>> fetchAllAnnonces() =>
      get<List<AnnonceModel>>('/annonce/all',
          decoder: (obj) => AnnonceModel.listFromJson(obj));
  Future<Response<List<StoreModel>>> fetchAllStores() =>
      get<List<StoreModel>>('/store/all',
          decoder: (obj) => StoreModel.listFromJson(obj));

  @override
  void onInit() {
    httpClient.baseUrl = baseApiUrl;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "Bearer ${UserModel.token}"
      });
      return request;
    });

    super.onInit();
  }
}
