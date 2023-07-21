import 'package:beacon/Models/offre_model.dart';

class PointOffreModel extends OffreModel {
  int points;

  PointOffreModel({
    required this.points,
    required description,
    required terms,
    required storeName,
    required idStore,
    required id,
  }) : super(
          description: description,
          idStore: idStore,
          id: id,
          storeName: storeName,
          terms: terms,
        );

  factory PointOffreModel.fromJson(Map<String, dynamic> json) =>
      PointOffreModel(
        id: json["id"],
        terms: json["terms"],
        description: json["description"],
        storeName: json["store"]["name"],
        idStore: json["idStore"],
        points: json["points"],
      );

  static List<PointOffreModel> listFromJson(list) =>
      List<PointOffreModel>.from(list.map((x) => PointOffreModel.fromJson(x)));
}
