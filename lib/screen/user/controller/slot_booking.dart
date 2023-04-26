import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:turf/screen/user/utils/base_url.dart';

Future<void> bookSlot(String token, dynamic body) async {
  const url = "$baseurl/book/slot";
  try {
    final response = await Dio().post(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: json.encode(body),
    );
    if (response.statusCode == 200) {
      print('Slot booked successfully');
      print(response.data);
    } else {
      print('Failed to book slot');
    }
  } catch (error) {
    print('Error booking slot: $error');
  }
}
