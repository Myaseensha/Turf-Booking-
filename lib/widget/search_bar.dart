import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/core/color.dart';
import 'package:turf/screen/user/controller/user_details_get.dart';
import 'package:turf/screen/user/view/user_details.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchQuery,
    required this.onSearchQueryChanged,
  }) : super(key: key);

  final String searchQuery;
  final Function(String) onSearchQueryChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              Icons.person,
              color: conWhite,
            ),
            onPressed: () async {
              final data = await getUserDetails();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserPage(
                      userName: data.username,
                      phoneNumber: '${data.mobile}',
                      email: data.email,
                    ),
                  ));

              final prefs = await SharedPreferences.getInstance();
              final token = prefs.getString('token');
              print(token);
            },
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        onChanged: onSearchQueryChanged,
      ),
    );
  }
}
