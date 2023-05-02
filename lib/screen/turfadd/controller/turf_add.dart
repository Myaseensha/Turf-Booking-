import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf/screen/turfadd/utils/url.dart';

import '../model/turf_add.dart';
import '../view/turf_create_massege.dart';

Future<void> createCourt(BuildContext context, CourtAdd court) async {
  final dio = Dio();
  final headers = {'Content-Type': 'multipart/form-data'};
  try {
    final formData = FormData.fromMap({
      'courtName': court.courtName,
      'email': court.email,
      'mobile': court.mobile,
      'password': court.password,
      'location': court.location,
      'distric': court.district,
      'state': court.state,
      'event': court.event,
      'loction_Details': court.locationDetails,
      'images': await MultipartFile.fromFile(court.imageFiles[0].path),
    });

    final response = await dio.post(
      ceratcourt,
      data: formData,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const TurfCreated(),
          ),
          (route) => false);
    } else {
      log(response.statusMessage.toString());
    }
  } catch (e) {
    log(e.toString());

    const snackBar = SnackBar(
      content: Text('Please check your mobile data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
