import 'package:flutter/material.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/screen/user/view/turf_profile_screen.dart';

import '../../../core/color.dart';
import '../../../core/padding.dart';
import '../../../widget/otpfrom.dart';

class VerificationScreenUser extends StatelessWidget {
  VerificationScreenUser({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cblack,
        body: SafeArea(
            child: SingleChildScrollView(
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
                padding: pTRL20,
                child: Text(
                  verifyCode,
                  style: mainTextG,
                ),
              ),
              Cheight20,
              Cheight20,
              Form(
                key: _formKey,
                child: Padding(
                  padding: pRL20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPfrom(
                        controllers: num1,
                        colors: Cgreen,
                      ),
                      OTPfrom(
                        controllers: num2,
                        colors: Cgreen,
                      ),
                      OTPfrom(
                        controllers: num3,
                        colors: Cgreen,
                      ),
                      OTPfrom(
                        controllers: num4,
                        colors: Cgreen,
                      ),
                    ],
                  ),
                ),
              ),
              Cheight20,
              Padding(
                padding: pTRL20,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TurfProfileSceen(),
                            ));
                      } else {}
                    },
                    style: signup,
                    child: Text(verify, style: shortTextW),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
