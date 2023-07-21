import 'package:beacon/Models/point_offre_model.dart';
import 'package:beacon/Models/voucher_model.dart';

class AnnonceModel {
  int? id;
  String description;
  String url;

  AnnonceModel({
    this.id,
    required this.description,
    required this.url,
  });

  factory AnnonceModel.fromJson(Map<String, dynamic> json) => AnnonceModel(
        description: json["description"],
        url: json['url'],
      );

  static List<AnnonceModel> listFromJson(list) =>
      List<AnnonceModel>.from(list.map((x) => AnnonceModel.fromJson(x)));

  @override
  bool operator ==(o) => o is AnnonceModel && o.id == id;

  @override
  int get hashCode => id.hashCode;
}
