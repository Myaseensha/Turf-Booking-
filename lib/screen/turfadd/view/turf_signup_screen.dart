import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/turfadd/view/turf_login_screen.dart';

import '../../../util/from_filde.dart';

class SignUpScreenTurf extends StatelessWidget {
  SignUpScreenTurf({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
              padding: pTRL20,
              child: Text(
                "Create your ground !.. ",
                style: mainTextG,
              ),
            ),
            FromField(
              bordercolor: Cgrey,
              hint: 'Turfname',
              validetmsg: 'Please Enter your Email',
              controllers: nameController,
            ),
            FromField(
              bordercolor: Cgrey,
              hint: 'Email',
              validetmsg: 'Please Enter your Email',
              controllers: emailController,
            ),
            FromField(
              bordercolor: Cgrey,
              hint: 'Number',
              validetmsg: 'Please Enter your Number',
              controllers: numberController,
            ),
            FromField(
              bordercolor: Cgrey,
              hint: 'Password',
              validetmsg: 'Please Enter your Password',
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
                      return;
                    }
                  },
                  style: google,
                  child: Text('Sign Up with Google', style: shortTextB),
                ),
              ),
            ), //----------------------------------------------------------GoogleSignUP---------------------------------------------------
            Cheight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
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
                      'Login',
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
