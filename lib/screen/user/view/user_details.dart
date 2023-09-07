import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                child: SingleChildScrollView(
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
                            child: ExpansionTile(
                          title: Row(
                            children: [
                              Text(
                                "Booking history",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.history,
                                color: Colors.grey[500],
                              ),
                            ],
                          ),
                          children: [
                            FutureBuilder(
                              future: SharedPreferences.getInstance(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<SharedPreferences> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SizedBox(
                                    height: 50,
                                    child: Lottie.asset(
                                      'assets/Lottie/36621-sports-app-loading-indicator.json',
                                    ),
                                  );
                                } else {
                                  final prefs = snapshot.data;
                                  final token = prefs?.getString('token');
                                  if (token != null) {
                                    return FutureBuilder(
                                      future: getUserBookings(token, context),
                                      builder: (BuildContext context,
                                          AsyncSnapshot bookingsSnapshot) {
                                        if (bookingsSnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return SizedBox(
                                            height: 50,
                                            child: Lottie.asset(
                                              'assets/Lottie/36621-sports-app-loading-indicator.json',
                                            ),
                                          );
                                        } else {
                                          return UserBookingsSheet(
                                              bookings: bookingsSnapshot.data,
                                              onClose: () {
                                                Navigator.pop(context);
                                              });
                                        }
                                      },
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                }
                              },
                            ),
                          ],
                        )),
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
                                      builder: (context) =>
                                          const SplashScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: const Text("Log out"),
                              ),
                            ),
                          ],
                        )
                      ]),
                ))));
  }
}
