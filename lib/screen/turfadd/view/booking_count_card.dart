import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../controller/booking_counts.dart';

FutureBuilder<Map<String, dynamic>> bookingCountCard(String token) {
  return FutureBuilder<Map<String, dynamic>>(
    future: bookingReport(token),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!;
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${data["today"]}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Today's Bookings",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey[300],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${data["total"]}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Total Bookings",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return Center(
        child: SizedBox(
          height: 50,
          child: Lottie.asset('assets/Lottie/lf20_nwgje0cj.json'),
        ),
      );
    },
  );
}
