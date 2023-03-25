import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/user/view/user_signup_screen.dart';
import '../../../widget/button.dart';
import '../../turfadd/view/turf_signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 300,
            alignment: Alignment.center,
            child: const Image(
              image: AssetImage('assets/meet-pals.png'),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: p20,
            alignment: Alignment.centerLeft,
            child: Text(intro, style: mainTextG),
          ),
          Container(
            padding: pBRL20,
            alignment: Alignment.centerLeft,
            child: Text(short, style: shortTextW),
          ),
          Button(
            colorB: conGreen,
            colorF: conBlack,
            title: 'To Get Listed',
            style: shortTextW,
            classname: SignUpScreenTurf(),
          ),
          Button(
            colorB: conWhite,
            colorF: conGreen,
            title: 'To Book Avenue',
            style: shortTextBlack,
            classname: SignUpScreenUser(),
          ),
          conHeight10
        ],
      )),
    );
  }
}
