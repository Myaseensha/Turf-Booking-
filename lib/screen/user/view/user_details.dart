import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/onborde_screen/splash_screen.dart';
import 'package:turf/screen/user/controller/user_details_edit.dart';
import 'package:turf/widget/button.dart';

import '../../../core/color.dart';
import '../../../widget/coustm_style.dart';

class UserPage extends StatefulWidget {
  UserPage({
    Key? key,
    required this.userName,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  final String userName;
  final String phoneNumber;
  final String email;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
      body: Center(
        child: Padding(
          padding: pRL20,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/image/avatar-370-456322-512 (1).webp'),
                  maxRadius: 100,
                ),
                const SizedBox(height: 20),
                formStyle(name, enabled: isEditing),
                const SizedBox(height: 20),
                formStyle(mobile, enabled: isEditing),
                const SizedBox(height: 20),
                formStyle(mail, enabled: isEditing),
                const SizedBox(height: 20),
                Button(
                  colorB: conGreen,
                  colorF: conWhite,
                  title: isEditing ? 'Save' : 'Edit',
                  style: shortTextW,
                  onpress: () async {
                    setState(() {
                      isEditing = !isEditing;
                    });
                    if (!isEditing) {
                      await updateProfile(
                          name.text, mail.text, mobile.text, context);
                    }
                  },
                ),
                Button(
                  colorB: conGreen,
                  colorF: conWhite,
                  title: "LogOut",
                  style: shortTextW,
                  onpress: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashScreen(),
                        ),
                        (route) => false);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
