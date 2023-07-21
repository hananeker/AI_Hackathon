import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Models/voucher_model.dart';

class OffreModel {
  int? id;
  int idStore;
  String description;
  String terms;
  String storeName;

  OffreModel(
      {this.id,
      required this.description,
      required this.idStore,
      required this.storeName,
      required this.terms});

  factory OffreModel.fromJson(Map<String, dynamic> json) =>
      (json['points'] != null)
          ? PointOffreModel.fromJson(json)
          : VoucherModel.fromJson(json);

  static List<OffreModel> listFromJson(list1, list2) {
    List<OffreModel> offers =
        List<OffreModel>.from(list1.map((x) => OffreModel.fromJson(x)));
    offers.addAll(
        List<OffreModel>.from(list2.map((x) => OffreModel.fromJson(x))));
    return offers;
  }

  @override
  bool operator ==(o) =>
      o is OffreModel &&
      o.id == id &&
      o.description == description &&
      o.terms == terms;

  @override
  int get hashCode => description.hashCode;
}
