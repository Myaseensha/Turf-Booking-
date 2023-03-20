class Signup {
  Signup({
    required this.email,
    required this.mobile,
  });

  String email;
  int mobile;

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        email: json["email"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "mobile": mobile,
      };
}
