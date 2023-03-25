import 'dart:io';

class CourtAdd {
  final String courtName;
  final String email;
  final String mobile;
  final String password;
  final String location;
  final String district;
  final String state;
  final String event;
  final String locationDetails;
  final File imageFile;

  CourtAdd({
    required this.courtName,
    required this.email,
    required this.mobile,
    required this.password,
    required this.location,
    required this.district,
    required this.state,
    required this.event,
    required this.locationDetails,
    required this.imageFile,
  });

  factory CourtAdd.fromJson(Map<String, dynamic> json) {
    return CourtAdd(
      courtName: json['courtName'],
      email: json['email'],
      mobile: json['mobile'],
      password: json['password'],
      location: json['location'],
      district: json['district'],
      state: json['state'],
      event: json['event'],
      locationDetails: json['locationDetails'],
      imageFile: File(json['imageFilePath']),
    );
  }

  Map<String, dynamic> toJson() => {
        'courtName': courtName,
        'email': email,
        'mobile': mobile,
        'password': password,
        'location': location,
        'district': district,
        'state': state,
        'event': event,
        'locationDetails': locationDetails,
        'imageFilePath': imageFile.path,
      };
}
