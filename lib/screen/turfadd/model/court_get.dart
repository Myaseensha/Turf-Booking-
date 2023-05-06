class CourtDetails {
  final String courtName;
  final String email;
  final String mobile;
  final List<dynamic> images;
  final String location;
  final int price;
  final String holiday;
  final String closingTime;
  final String openingTime;
  CourtDetails(
      {required this.courtName,
      required this.email,
      required this.mobile,
      required this.location,
      required this.images,
      required this.price,
      required this.holiday,
      required this.closingTime,
      required this.openingTime});

  factory CourtDetails.fromJson(Map<String, dynamic> json) {
    return CourtDetails(
        courtName: json['courtName'],
        email: json['email'],
        mobile: json['mobile'],
        images: json['images'],
        location: json['loction_Details'],
        price: json['Price'],
        holiday: json['Holiday'],
        closingTime: json['closingTime'],
        openingTime: json['openingTime']);
  }
}
