import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/screen/user/view/user_login_screen.dart';
import 'package:turf/util/from_filde.dart';

import '../../../core/h_w.dart';
import '../../../core/padding.dart';

class SignUpScreenUser extends StatelessWidget {
  SignUpScreenUser({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: pTRL30,
              child: Text(
                "Find your  ground... ",
                style: mainTextG,
              ),
            ),
            FromField(
              hint: 'Name',
              validetmsg: 'Please Enter your Number',
              controllers: nameController,
              bordercolor: Cwhite,
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
                  child: Text('SignUp', style: shortTextW),
                ),
              ),
            ), //--------------------------------------------------------signupButton----------------------------------------------
            Center(
                child: Padding(
              padding: p10,
              child: Text(
                'Or with',
                style: shortTextW,
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
                      return;
                    }
                  },
                  style: google,
                  child: Text('Sign Up with Google', style: shortTextB),
                ),
              ),
            ), //----------------------------------------------------------GoogleSignUP---------------------------------------------------
            Cheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: shortTextW,
                ),
                Cwidth10,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserLoginScreen(),
                        ));
                  },
                  child: Text(
                    'Login',
                    style: minTextG,
                  ),
                ),
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
