import 'package:flutter/material.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/screen/turfadd/view/turfprofile_add.dart';

import '../../../core/color.dart';
import '../../../core/padding.dart';
import '../../../util/otpfrom.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
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
                  "Enter your Verification Code ",
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
                        colors: Cgrey,
                      ),
                      OTPfrom(
                        controllers: num2,
                        colors: Cgrey,
                      ),
                      OTPfrom(
                        controllers: num3,
                        colors: Cgrey,
                      ),
                      OTPfrom(
                        controllers: num4,
                        colors: Cgrey,
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
                              builder: (context) => const TurfProfileAdd(),
                            ));
                      } else {}
                    },
                    style: signup,
                    child: Text('Verify', style: shortTextW),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
