import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/screen/user/utils/base_url.dart';
import '../model/user_model.dart';

Future<UserModel> getUserDetails() async {
  final url = Uri.parse('$baseurl/profile/user-details');
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  final response = await http.get(
    url,
    headers: {'Authorization': 'Bearer $token'},
  );

  if (response.statusCode == 200 || response.statusCode == 204) {
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user details');
  }
}
