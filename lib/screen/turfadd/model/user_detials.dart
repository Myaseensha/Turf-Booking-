import 'bookign_user.dart';

class BookingUser {
  final String id;
  final User user;
  final String turf;
  final DateTime bookDate;
  final String time;
  final String payment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final int rate;

  BookingUser({
    required this.id,
    required this.user,
    required this.turf,
    required this.bookDate,
    required this.time,
    required this.payment,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.rate,
  });

  factory BookingUser.fromJson(Map<String, dynamic> json) => BookingUser(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        turf: json["turf"],
        bookDate: DateTime.parse(json["bookDate"]),
        time: json["time"],
        payment: json["payment"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        rate: json["rate"],
      );
}
