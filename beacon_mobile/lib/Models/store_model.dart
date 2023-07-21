import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Models/voucher_model.dart';

class StoreModel {
  int id;
  String name;
  String email;
  String address;
  String? imageUrl;

  StoreModel({
    required this.id,
    required this.email,
    this.imageUrl,
    required this.address,
    required this.name,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        address: json["address"],
        imageUrl: json['image'],
      );

  static List<StoreModel> listFromJson(list) =>
      List<StoreModel>.from(list.map((x) => StoreModel.fromJson(x)));

  @override
  bool operator ==(o) => o is StoreModel && o.id == id;

  @override
  int get hashCode => id.hashCode;
}
