import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/hardText.dart';
import 'package:turf/core/padding.dart';
import '../../util/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
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
            colorB: Cgreen,
            colorF: Cblack,
            title: 'To Get Listed',
            style: shortTextW,
          ),
          Button(
            colorB: Cwhite,
            colorF: Cgreen,
            title: 'To Book Avenue',
            style: shortTextB,
          ),
        ],
      )),
    );
  }
}
