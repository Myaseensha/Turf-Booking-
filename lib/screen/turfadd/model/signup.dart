class Signup {
  String email;
  String mobile;

  Signup({required this.email, required this.mobile});

  factory Signup.fromJson(Map<String, dynamic> json) {
    return Signup(
      email: json['email'],
      mobile: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'mobile': mobile,
    };
  }
}
