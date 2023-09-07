import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:turf/core/color.dart';
import 'package:turf/screen/user/controller/user_details_get.dart';
import 'package:turf/screen/user/view/user_details.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({
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
              if (data == ConnectionState.waiting) {
                Center(
                    child: SizedBox(
                  height: 50,
                  child: Lottie.asset(
                      'assets/Lottie/36621-sports-app-loading-indicator.json'),
                ));
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserPage(
                      userName: data.username,
                      phoneNumber: data.mobile,
                      email: data.email,
                    ),
                  ));
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
