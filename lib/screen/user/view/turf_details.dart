import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/color.dart';
import '../model/single_turf_get.dart';

Card turfDetailsCard(double maxWidth, SingleCourt courts) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.location_pin, color: conBlack),
          title: Text(
            'Location',
            style: textstyle(maxWidth),
          ),
          subtitle: Text(
              '${courts.state}, ${courts.district}, ${courts.location}, ${courts.locationDetails}',
              style: subtextstyle(maxWidth)),
        ),
        GestureDetector(
          onTap: () {
            // ignore: deprecated_member_use
            launch("tel:${courts.mobile}");
          },
          child: ListTile(
            leading: Icon(Icons.phone, color: conBlack),
            title: Text('Contact', style: textstyle(maxWidth)),
            subtitle: Text(courts.mobile, style: subtextstyle(maxWidth)),
          ),
        ),
        GestureDetector(
          onTap: () {
            // ignore: deprecated_member_use
            launch("mailto:${courts.email}");
          },
          child: ListTile(
            leading: Icon(Icons.email, color: conBlack),
            title: Text('Email', style: textstyle(maxWidth)),
            subtitle: Text(courts.email, style: subtextstyle(maxWidth)),
          ),
        ),
        ListTile(
          leading: Icon(Icons.event, color: conBlack),
          title: Text(
            'Event Type',
            style: textstyle(maxWidth),
          ),
          subtitle: Text(courts.event, style: subtextstyle(maxWidth)),
        ),
        ListTile(
          leading: Icon(Icons.attach_money, color: conBlack),
          title: Text('Court Fee', style: textstyle(maxWidth)),
          subtitle: Text('${courts.price}', style: subtextstyle(maxWidth)),
        ),
        ListTile(
          leading: Icon(Icons.calendar_today, color: conBlack),
          title: Text('Holiday', style: textstyle(maxWidth)),
          subtitle: Text(
            courts.holiday,
            style: subtextstyle(maxWidth),
          ),
        ),
      ],
    ),
  );
}
