class Turf {
  final String? turfname;
  final String? image;
  final String? location;
  final String? sportstype;
  Turf({this.image, this.location, this.sportstype, this.turfname});
  factory Turf.fromJson(Map<String, dynamic> json) {
    return Turf(
        turfname: json['courtName'],
        image: json['images']['location'],
        location: json['location'],
        sportstype: json['event']);
  }
}
