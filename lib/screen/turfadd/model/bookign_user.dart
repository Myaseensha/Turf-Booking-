class User {
  final String id;
  final String username;
  final String email;
  final String mobile;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.mobile,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}
