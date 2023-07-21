import 'package:beacon/Models/offre_model.dart';
import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Models/voucher_model.dart';

class BeaconModel {
  int? id;
  String identifier;
  String proximityUUID;

  List<OffreModel> offers;

  BeaconModel({
    this.id,
    required this.identifier,
    required this.proximityUUID,
    required this.offers,
  });

  factory BeaconModel.fromJson(Map<String, dynamic> json) => BeaconModel(
        id: json["id"],
        proximityUUID: json["proximityUUID"],
        identifier: json["identifier"],
        offers: OffreModel.listFromJson(
            json['available_vouchers'], json['available_pointoffer']),
      );

  static List<int> idsListFromJson(list) =>
      List<int>.from(list.map((x) => x['id']));

  static List<BeaconModel> listFromJson(list) {
    print(list);
    return List<BeaconModel>.from(list.map((x) => BeaconModel.fromJson(x)));
  }

  @override
  bool operator ==(o) => o is BeaconModel && o.proximityUUID == proximityUUID;

  @override
  int get hashCode => proximityUUID.hashCode;
}
