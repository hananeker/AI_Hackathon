class UserModel {
  static User? user;
  static String? token;

  // UserModel.fromJson(Map<String, dynamic> json) {
  //   UserModel.user = User.fromJson(json['user']);
  //   UserModel.token = json['token'];
  // }
}

class User {
  int? id;
  String username;
  String gender;
  String email;
  int points;
  int? totalVouchers;
  String? password;

  User({
    this.id,
    required this.email,
    required this.gender,
    required this.username,
    required this.points,
    this.totalVouchers,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["name"],
      gender: json["gender"],
      points: json["points"],
      email: json["email"],
      totalVouchers: json["total_vouchers"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": username,
        "email": email,
        "gender": gender,
        "password": password,
      };

  @override
  String toString() {
    return "id : $id\nname : $username\nemail : $email\ngender : $gender";
  }
}
