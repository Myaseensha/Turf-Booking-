import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/turfadd/model/signup.dart';
import 'package:turf/screen/turfadd/view/turf_login_screen.dart';
import 'package:turf/screen/turfadd/view/vreyfication.dart';
import 'package:http/http.dart' as http;
import 'package:turf/utils/url.dart';
import '../../../widget/from_filde.dart';

class SignUpScreenTurf extends StatelessWidget {
  SignUpScreenTurf({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    log('Otp');
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
            FromField(
              bordercolor: Cgrey,
              hint: passwordText,
              textleangthe: 8,
              validetmsg: passwordTextCommend,
              controllers: passwordController,
            ), //------------------------------------------------------fromend----------------------------------------
            Padding(
              padding: pTRL20,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Signup signup = Signup(
                          email: emailController.text.trim(),
                          mobile: int.parse(numberController.text.trim()));
                      log('message');
                      singupOtp(context, signup);
                    } else {}
                  },
                  style: signup,
                  child: Text(signUp, style: shortTextW),
                ),
              ),
            ),

            /*--------------------------------------------------------signupButton------------------------------------------------------*/

            Center(
                child: Padding(
              padding: p10,
              child: Text(
                or,
                style: shortTextB,
              ),
            )),
            Padding(
              padding: pRL40,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    } else {
                      log('message//////////////////////');
                    }
                  },
                  style: google,
                  child: Text(signgoogle, style: shortTextB),
                ),
              ),
            ),

            /*----------------------------------------------------------GoogleSignUP----------------------------------------------------------*/

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

  Future singupOtp(BuildContext context, Signup signup) async {
    log('Sign up fn pressed');

    // log(signup!.email.toString());
    // log(signup.mobile.toString());
    try {
      log(signup.email);
      final resp = await http.post(
          Uri.parse(
            otp,
          ),
          body: jsonEncode(signup.toJson()));

      if (resp.statusCode == 200) {
        log('hhshdfskhdscsh');
        log(resp.body);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => VerificationScreen()));
      } else {
        var snackBar = const SnackBar(
          content: Text('Please enter valide entry'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      var snackBar = const SnackBar(
        content: Text('Please check your data'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      log("$e");
    }
  }
}
