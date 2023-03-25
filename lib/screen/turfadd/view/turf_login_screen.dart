import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/core/padding.dart';

import '../../../widget/from_filde.dart';

class LoginScreenTurf extends StatelessWidget {
  LoginScreenTurf({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conWhite,
      appBar: AppBar(
        title: Text(login),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              child: Lottie.asset('name'),
            ),
            Container(
              padding: pTRL20,
              child: Text(
                enterCommend,
                style: mainTextG,
              ),
            ),
            FromField(
              hint: emailText,
              validetmsg: emailTextCommend,
              controllers: emailController,
              bordercolor: conGrey,
            ),
            FromField(
              hint: passwordText,
              validetmsg: passwordTextCommend,
              controllers: passwordController,
              bordercolor: conGrey,
            ),
            Padding(
              padding: pTRL20,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      return;
                    }
                  },
                  style: signup,
                  child: Text(login, style: shortTextW),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
