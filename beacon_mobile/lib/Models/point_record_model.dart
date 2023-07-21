class PointRecordModel {
  int points;
  String operation;
  DateTime date;

  PointRecordModel({
    required this.points,
    required this.date,
    required this.operation,
  });

  factory PointRecordModel.fromJson(Map<String, dynamic> json) =>
      PointRecordModel(
        points: json["points"],
        date: DateTime.parse(json["created_at"]),
        operation: json["operation"],
      );

  static List<PointRecordModel> listFromJson(list) {
    return List<PointRecordModel>.from(
        list.map((x) => PointRecordModel.fromJson(x)));
  }
}
