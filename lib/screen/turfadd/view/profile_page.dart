import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:turf/core/h_w.dart';
import 'package:turf/screen/turfadd/controller/fatchturefprofile.dart';
import 'package:turf/screen/turfadd/model/court_get.dart';

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
          ));
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
                  height: maxHeight / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(court.images[0]['location']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: maxHeight * 0.25,
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
                            width: maxWidth * 0.5,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
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
                          Icon(Icons.phone, color: Colors.grey),
                          SizedBox(width: maxWidth * 0.01),
                          Text(
                            court.mobile.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: maxHeight * 0.01),
                      Row(
                        children: [
                          Icon(Icons.email_outlined, color: Colors.grey),
                          SizedBox(width: maxWidth * 0.01),
                          Text(
                            court.email.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: maxHeight * 0.03),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim molestie turpis, at pulvinar lorem dapibus ac. Nam efficitur nulla velit, vel finibus eros ullamcorper a. Donec volutpat, nibh ac hendrerit maximus, tellus elit sagittis diam, quis congue nunc lacus quis magna. Duis tempus nunc at sapien luctus, nec ullamcorper neque dictum. Nullam ut magna suscipit, tempor nulla vitae, cursus metus. In sagittis mauris vel sem porta bibendum. Vestibulum eu diam sed quam elementum elementum. Vestibulum in metus vel nisl rhoncus sodales a vitae mi. Cras eget mauris sit amet nisi interdum venenatis. Donec euismod libero sed finibus auctor.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
        }
      },
    ));
  }
}
