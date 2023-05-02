import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/turfadd/controller/turf_getotp.dart';
import 'package:turf/screen/turfadd/view/turf_login_screen.dart';

import '../../../widget/from_filde.dart';

class SignUpScreenTurf extends StatelessWidget {
  SignUpScreenTurf({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController turfnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    log('Otp');
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: conWhite,
      appBar: AppBar(
        title: Text(signUp),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: mediaQuery.size.height * 0.25,
                  child: Lottie.asset(
                      'assets/Lottie/126572-football-team-players.json'),
                ),
                Container(
                  padding: pTRL20,
                  child: Text(
                    createCommend,
                    style: mainTextG,
                  ),
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: turfnameText,
                  validetmsg: nameTextCommend,
                  controllers: turfnameController,
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: emailText,
                  keytype: TextInputType.emailAddress,
                  validetmsg: emailTextCommend,
                  controllers: emailController,
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: phoneText,
                  textleangthe: 10,
                  keytype: TextInputType.number,
                  validetmsg: phoneTextCommend,
                  controllers: numberController,
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: passwordText,
                  textleangthe: 10,
                  keytype: TextInputType.visiblePassword,
                  validetmsg: passwordTextCommend,
                  controllers: passwordController,
                ),
                //------------------------------------------------------from end----------------------------------------
                Padding(
                  padding: pTRL20,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          log('validte and get otp function');
                          signupinfo(
                              context,
                              emailController.text,
                              numberController.text,
                              passwordController.text,
                              turfnameController.text);
                        } else {}
                      },
                      style: signup,
                      child: Text(signUp, style: shortTextW),
                    ),
                  ),
                ),

                /*----------------------------------------------------------login----------------------------------------------------------*/

                conHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      alreadyCommend,
                      style: shortTextBlack,
                    ),
                    conWidth10,
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenTurf(),
                              ));
                        },
                        child: Text(
                          login,
                          style: minTextG,
                        )),
                  ],
                ),
                conHeight20,
              ]),
        ),
      )),
    );
  }
}
