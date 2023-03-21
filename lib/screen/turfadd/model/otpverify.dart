class OtpSend {
  OtpSend({
    required this.otp,
    required this.mobile,
  });

  String otp;
  String mobile;

  factory OtpSend.fromJson(Map<String, dynamic> json) => OtpSend(
        otp: json["otp"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "mobile": mobile,
      };
}
