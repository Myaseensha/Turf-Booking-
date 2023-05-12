import 'package:flutter/material.dart';
import 'package:turf/screen/user/view/turf_booking_page.dart';
import 'package:turf/widget/button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/bottomsheet_style.dart';
import '../../../core/color.dart';
import '../model/single_turf_get.dart';
import 'review_submitebox.dart';

Row turfRowButtons(double maxWidth, double maxHeight, SingleCourt courts,
    BuildContext context, String id) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      fancyfunctionButton(
          Colors.red, 0.23, 12, Icons.location_on_rounded, maxWidth, maxHeight,
          onpress: () async {
        String locationName =
            "${courts.locationDetails}, ${courts.location}, ${courts.district}";
        String url =
            'https://www.google.com/maps/search/?api=1&query=$locationName';

        // ignore: deprecated_member_use
        if (await canLaunch(url)) {
          // ignore: deprecated_member_use
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }, text: "Location"),
      fancyfunctionButton(
          conGreen, 0.40, 15, Icons.calendar_today_rounded, maxWidth, maxHeight,
          onpress: () {
        showModalBottomSheet(
          backgroundColor: conGreen,
          shape: roundedRectangleBorder,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: BookingPage(
                  tokenid: id,
                  email: courts.email,
                  number: courts.mobile,
                  userName: courts.courtName,
                  fee: courts.price * 100,
                ),
              ),
            );
          },
        );
      }, text: "Book Slots"),
      fancyfunctionButton(
          Colors.orange, 0.23, 12, Icons.star, maxWidth, maxHeight,
          ratings: courts.rating.toStringAsFixed(1).toString(), onpress: () {
        showDialog(
          context: context,
          builder: (context) => ReviewDialog(
            id: id,
          ),
        );
      }, text: "Review"),
    ],
  );
}
