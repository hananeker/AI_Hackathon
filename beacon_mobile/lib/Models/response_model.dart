import 'package:beacon/Models/user_model.dart';

class ResponseModel {
  String status;
  String message;
  String? ref;

  ResponseModel({required this.message, required this.status, this.ref});

  factory ResponseModel.fromJson(dynamic json) {
    // print(json);
    // print(UserModel.token);
    return ResponseModel(
      status: (json["status"] != null) ? json["status"] : '',
      message: json["message"],
      ref: (json["ref"] == null) ? null : json["ref"],
    );
  }
}
