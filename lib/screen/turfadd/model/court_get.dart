class CourtDetails {
  final String courtName;
  final String email;
  final String mobile;
  final List<dynamic> images;

  CourtDetails({
    required this.courtName,
    required this.email,
    required this.mobile,
    required this.images,
  });

  factory CourtDetails.fromJson(Map<String, dynamic> json) {
    return CourtDetails(
      courtName: json['courtName'],
      email: json['email'],
      mobile: json['mobile'],
      images: json['images'],
    );
  }
}
