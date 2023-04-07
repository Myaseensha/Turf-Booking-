class Court {
  final String id;
  final String courtName;
  final String email;
  final String mobile;
  final List<dynamic> images;
  final String location;
  final String locationDetails;
  final String district;
  final String state;
  final String holiday;
  final String event;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool request;
  final bool block;

  Court({
    required this.id,
    required this.courtName,
    required this.email,
    required this.mobile,
    required this.images,
    required this.location,
    required this.locationDetails,
    required this.district,
    required this.state,
    required this.holiday,
    required this.event,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.request,
    required this.block,
  });

  factory Court.fromJson(Map<String, dynamic> json) {
    return Court(
      id: json['_id'],
      courtName: json['courtName'],
      email: json['email'],
      mobile: json['mobile'],
      images: json['images'],
      location: json['location'],
      locationDetails: json['loction_Details'],
      district: json['distric'],
      state: json['state'],
      holiday: json['Holiday'],
      event: json['event'],
      price: json['Price'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      request: json['request'],
      block: json['block'],
    );
  }
}
