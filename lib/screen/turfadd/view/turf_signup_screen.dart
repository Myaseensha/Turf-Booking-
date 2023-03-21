import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/turfadd/controller/turf_sign_funtion.dart';
import 'package:turf/screen/turfadd/view/turf_login_screen.dart';

import '../../../widget/from_filde.dart';

class SignUpScreenTurf extends StatelessWidget {
  SignUpScreenTurf({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    log('Otp');
    return Scaffold(
      backgroundColor: Cwhite,
      appBar: AppBar(
        title: Text(signUp),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: mediaQuery.size.height * 0.35,
              child: Lottie.asset('assets/Lottie/61182-ball-sport.json'),
            ),
            Container(
              padding: pTRL20,
              child: Text(
                createCommend,
                style: mainTextG,
              ),
            ),

            FromField(
              bordercolor: Cgrey,
              hint: emailText,
              keytype: TextInputType.emailAddress,
              validetmsg: emailTextCommend,
              controllers: emailController,
            ),
            FromField(
              bordercolor: Cgrey,
              hint: phoneText,
              textleangthe: 10,
              keytype: TextInputType.number,
              validetmsg: phoneTextCommend,
              controllers: numberController,
            ),
            //------------------------------------------------------fromend----------------------------------------
            Padding(
              padding: pTRL20,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log('message');
                      singupOtpGet(
                          context, emailController.text, numberController.text);
                      numbersave(numberController.text);
                    } else {}
                  },
                  style: signup,
                  child: Text(signUp, style: shortTextW),
                ),
              ),
            ),

            /*--------------------------------------------------------signupButton------------------------------------------------------*/

            /*----------------------------------------------------------login----------------------------------------------------------*/

            Cheight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  alreadyCommend,
                  style: shortTextB,
                ),
                Cwidth10,
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
          ]),
        ),
      )),
    );
  }
}
