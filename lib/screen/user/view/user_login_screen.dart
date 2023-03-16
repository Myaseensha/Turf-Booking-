import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/padding.dart';

import '../../../util/from_filde.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('Login'),
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
                "Tap your ground !.. ",
                style: mainTextG,
              ),
            ),
            FromField(
              hint: 'Email',
              validetmsg: 'Please Enter your Email',
              controllers: emailController,
              bordercolor: Cwhite,
            ),
            FromField(
              hint: 'Password',
              validetmsg: 'Please Enter your Password',
              controllers: passwordController,
              bordercolor: Cwhite,
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
                  child: Text('Login', style: shortTextW),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
