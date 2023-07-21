import 'package:beacon/Models/beacon_model.dart';
import 'package:beacon/Models/point_record_model.dart';
import 'package:beacon/Models/response_model.dart';
import 'package:beacon/Models/user_model.dart';
import 'package:beacon/Models/voucher_model.dart';
import 'package:beacon/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

class OffreProvider extends GetConnect {
  Future<Response<List<BeaconModel>>> fetchAllBeaconsWithOffers() =>
      get<List<BeaconModel>>('/beacon/all',
          headers: {
            "Authorization": "Bearer ${UserModel.token}",
            "Accept": "application/json"
          },
          decoder: (obj) => BeaconModel.listFromJson(obj));

  Future<Response<ResponseModel>> takePointOffer(int idPointOffre) {
    return post(
      '/poffers/take',
      {
        "idPointOffre": idPointOffre,
      },
      headers: {
        "Authorization": "Bearer ${UserModel.token}",
        "Accept": "application/json"
      },
      decoder: (obj) => ResponseModel.fromJson(obj),
    );
  }

  Future<Response<List<PointRecordModel>>> fetchPointsRecords() {
    return get(
      '/user/records',
      headers: {
        "Authorization": "Bearer ${UserModel.token}",
        "Accept": "application/json"
      },
      decoder: (obj) => PointRecordModel.listFromJson(obj),
    );
  }

  Future<Response<ResponseModel>> takeVoucher(int idVoucher) {
    return post(
      '/voucher/take',
      {
        "idVoucher": idVoucher,
      },
      headers: {
        "Authorization": "Bearer ${UserModel.token}",
        "Accept": "application/json"
      },
      decoder: (obj) => ResponseModel.fromJson(obj),
    );
  }

  Future<Response<ResponseModel>> useVoucher(int idVoucher, String passcode) {
    return post(
      '/voucher/use',
      {
        "idVoucher": idVoucher,
        "passcode": passcode,
      },
      headers: {
        "Authorization": "Bearer ${UserModel.token}",
        "Accept": "application/json"
      },
      decoder: (obj) => ResponseModel.fromJson(obj),
    );
  }

  Future<Response<ResponseModel>> redeemPoints(
      String passcode, int points, String storecode) {
    return post(
      '/poffers/use',
      {
        "points": points,
        "passcode": passcode,
        "storecode": storecode,
      },
      headers: {
        "Authorization": "Bearer ${UserModel.token}",
        "Accept": "application/json"
      },
      decoder: (obj) => ResponseModel.fromJson(obj),
    );
  }

  Future<Response<List<VoucherModel>>> fetchMyVouchers() =>
      get<List<VoucherModel>>(
        '/offers/me',
        headers: {
          "Authorization": "Bearer ${UserModel.token}",
          "Accept": "application/json"
        },
        decoder: (obj) => VoucherModel.listFromJson(obj['available_vouchers']),
      );

  Future<Response<List<VoucherModel>>> fetchUsedVouchers() =>
      get<List<VoucherModel>>('/offers/used',
          headers: {
            "Authorization": "Bearer ${UserModel.token}",
            "Accept": "application/json"
          },
          decoder: (obj) =>
              VoucherModel.listFromJson(obj['available_vouchers']));

  @override
  void onInit() {
    // final UserController userController = Get.find<UserController>();
    httpClient.baseUrl = baseApiUrl;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers.addAll({"Accept": "application/json"});
      return request;
    });
    // httpClient.addRequestModifier<dynamic>((request) {
    //   request.headers['Authorization'] = userController.token;
    //   return request;
    // });

    super.onInit();
  }
}
