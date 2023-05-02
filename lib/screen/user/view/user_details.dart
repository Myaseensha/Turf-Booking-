import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/padding.dart';

import 'package:turf/screen/onborde_screen/splash_screen.dart';
import 'package:turf/screen/user/controller/user_details_edit.dart';

import '../controller/booking_details.dart';
import '../model/booking_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    Key? key,
    required this.userName,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  final String userName;
  final String phoneNumber;
  final String email;

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  late final TextEditingController name;
  late final TextEditingController mobile;
  late final TextEditingController mail;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.userName);
    mobile = TextEditingController(text: widget.phoneNumber);
    mail = TextEditingController(text: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24.0),
                      const Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/image/avatar-370-456322-512 (1).webp',
                          ),
                          maxRadius: 64.0,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        enabled: isEditing,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: mobile,
                        decoration: const InputDecoration(
                          labelText: "Mobile",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        enabled: isEditing,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: mail,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        enabled: isEditing,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Card(
                        child: GestureDetector(
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            final token = prefs.getString('token');
                            if (token != null) {
                              final bookings =
                                  await getUserBookings(token, context);
                              if (bookings == ConnectionState.waiting) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: SizedBox(
                                    height: 50,
                                    child: Lottie.asset(
                                      'assets/Lottie/36621-sports-app-loading-indicator.json',
                                    ),
                                  ),
                                ));
                              } else {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return UserBookingsSheet(
                                          bookings: bookings,
                                          onClose: () {
                                            Navigator.pop(context);
                                          });
                                    });
                              }
                            }
                          },
                          child: Padding(
                            padding: p10,
                            child: Row(
                              children: [
                                Text(
                                  "Booking history",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0,
                                  ),
                                ),
                                conWidth10,
                                Icon(
                                  Icons.history,
                                  color: Colors.grey[500],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: isEditing
                                  ? () async {
                                      setState(() {
                                        isEditing = false;
                                      });

                                      await updateProfile(
                                        name.text,
                                        mail.text,
                                        mobile.text,
                                        context,
                                      );
                                    }
                                  : () {
                                      setState(() {
                                        isEditing = true;
                                      });
                                    },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                isEditing ? 'Save' : 'Edit',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.clear();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SplashScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: const Text("Log out"),
                            ),
                          ),
                        ],
                      )
                    ]))));
  }
}
