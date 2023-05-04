import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/turfadd/controller/dashboard.dart';

import 'package:turf/screen/turfadd/controller/fatchturefprofile.dart';
import 'package:turf/screen/turfadd/model/court_get.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:turf/screen/turfadd/view/turf_update.dart';
import 'package:turf/screen/turfadd/view/user_booking_report.dart';

import 'booking_count_card.dart';
import 'booking_table.dart';

class TurfProfile extends StatelessWidget {
  const TurfProfile({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CourtDetails?>(
        future: fetchTurfProfile(token, context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 50,
                child: Lottie.asset(
                    'assets/Lottie/36621-sports-app-loading-indicator.json'),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Could not fetch data'));
          } else {
            final court = snapshot.data!;
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double maxHeight = constraints.maxHeight;
                final double maxWidth = constraints.maxWidth;
                return Stack(
                  children: [
                    Container(
                      height: maxHeight / 3.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(court.images[0]['location']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: maxHeight * 0.18,
                        left: maxWidth * 0.05,
                        right: maxWidth * 0.04,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: maxHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: maxHeight * 0.090,
                                backgroundImage:
                                    NetworkImage(court.images[1]['location']),
                              ),
                              SizedBox(
                                height: maxHeight * 0.060,
                                width: maxWidth * 0.4,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TurfUpdate(
                                            email: court.email,
                                            holiday: court.holiday,
                                            mobile: court.mobile,
                                            locatiion: court.location,
                                            price: court.price.toString(),
                                            turfname: court.courtName,
                                            token: token,
                                          ),
                                        ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: maxHeight * 0.02),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    court.courtName,
                                    style: TextStyle(
                                      fontSize: maxWidth * 0.07,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: maxHeight * 0.01),
                                  Row(
                                    children: [
                                      const Icon(Icons.phone,
                                          color: Colors.grey),
                                      SizedBox(width: maxWidth * 0.01),
                                      Text(
                                        court.mobile.toString(),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: maxHeight * 0.01),
                                  Row(
                                    children: [
                                      const Icon(Icons.email_outlined,
                                          color: Colors.grey),
                                      SizedBox(width: maxWidth * 0.01),
                                      Text(
                                        court.email.toString(),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  bookingCountCard(token),
                                  SizedBox(height: maxHeight * 0.02),
                                  Padding(
                                    padding: pRL10,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UserBookingReport(
                                                token: token,
                                              ),
                                            ));
                                      },
                                      child: Card(
                                        color: Colors.orange,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const ListTile(
                                          leading: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                          title: Text(
                                            'Booked Users',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: maxHeight * 0.02),
                                  ExpansionTile(
                                    title: Card(
                                      color: Colors.blueAccent,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const ListTile(
                                        leading: Icon(
                                          Icons.attach_money,
                                          color: Colors.white,
                                        ),
                                        title: Text(
                                          'Earning Report',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    children: [
                                      monthelyBookingTable(context, token),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Card(
                                      color: Colors.green,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const ListTile(
                                        leading: Icon(
                                          Icons.dashboard,
                                          color: Colors.white,
                                        ),
                                        title: Text(
                                          'Dashboard',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    children: [
                                      FutureBuilder<charts.BarChart>(
                                        future: getMonthlyReportChart(token),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return SizedBox(
                                              height: 200,
                                              child: snapshot.data!,
                                            );
                                          } else if (snapshot.hasError) {
                                            return const Text(
                                                'Failed to fetch data');
                                          } else {
                                            return const CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
