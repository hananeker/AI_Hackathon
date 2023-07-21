import 'package:beacon/Models/offre_model.dart';

class VoucherModel extends OffreModel {
  int nbCustomers;
  String? ref;
  DateTime? usedAt;

  VoucherModel({
    required this.nbCustomers,
    this.ref,
    this.usedAt,
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

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["id"],
        terms: json["terms"],
        description: json["description"],
        storeName: json["store"]["name"],
        idStore: json["idStore"],
        nbCustomers: json["nbCustomers"],
        ref: (json["pivot"] == null)
            ? null
            : (json["pivot"]["ref"]) == null
                ? null
                : json["pivot"]["ref"],
        usedAt: (json["pivot"] == null)
            ? null
            : (json["pivot"]["updated_at"]) == null
                ? null
                : DateTime.parse(json["pivot"]["updated_at"]),
      );

  static List<VoucherModel> listFromJson(list) =>
      List<VoucherModel>.from(list.map((x) => VoucherModel.fromJson(x)));
}
