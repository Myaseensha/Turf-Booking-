class SingleCourt {
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
  final int price;
  final bool request;
  final bool block;
  final num rating;

  SingleCourt(
      {required this.id,
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
      required this.request,
      required this.block,
      required this.rating});

  factory SingleCourt.fromJson(Map<String, dynamic> json) {
    return SingleCourt(
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
        price: json['Price'],
        request: json['request'],
        block: json['block'],
        rating: json['rating']);
  }
}
