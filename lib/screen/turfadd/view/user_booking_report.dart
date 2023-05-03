import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/screen/turfadd/model/user_detials.dart';
import 'package:intl/intl.dart';

import '../controller/booking_users.dart';

class UserBookingReport extends StatelessWidget {
  UserBookingReport({
    super.key,
    required this.token,
  });
  String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<BookingUser>>(
        future: bookedUsers(token, context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.separated(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                String time = user.time;
                DateTime date =
                    user.bookDate; // Replace with your DateTime object
                String formattedDate = DateFormat('dd/MM/yyyy').format(date);
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.user.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xff282828),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.email_outlined,
                              size: 20, color: Color(0xff282828)),
                          SizedBox(width: 8),
                          Text(
                            user.user.email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff282828),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.phone_outlined,
                              size: 20, color: Color(0xff282828)),
                          SizedBox(width: 8),
                          Text(
                            user.user.mobile,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff282828),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.credit_card_outlined,
                              size: 20, color: Color(0xff282828)),
                          SizedBox(width: 8),
                          Text(
                            user.payment,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff282828),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.monetization_on_outlined,
                              size: 20, color: Color(0xff282828)),
                          SizedBox(width: 8),
                          Text(
                            user.rate.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff282828),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: Color(0xffBFBFBF),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              color: Color(0xffBFBFBF),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            );
          } else {
            return Center(
              child: SizedBox(
                height: 50,
                child: Lottie.asset(
                    'assets/Lottie/36621-sports-app-loading-indicator.json'),
              ),
            );
          }
        },
      ),
    );
  }
}
