import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/core/color.dart';
import 'package:turf/screen/user/controller/user_verification.dart';
import 'package:turf/screen/user/view/user_login_screen.dart';

import 'package:turf/widget/from_filde.dart';

import '../../../core/h_w.dart';
import '../../../core/hard_text.dart';
import '../../../core/padding.dart';

class SignUpScreenUser extends StatelessWidget {
  SignUpScreenUser({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conBlack,
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
                Center(
                    child: SizedBox(
                  child: Lottie.asset('assets/Lottie/dlf10_KtZi3gfvBz.json'),
                )),
                Container(
                  padding: pTRL20,
                  child: Text(
                    findText,
                    style: mainTextG,
                  ),
                ),
                FromField(
                  hint: nameText,
                  validetmsg: nameTextCommend,
                  controllers: nameController,
                  bordercolor: conWhite,
                  keytype: TextInputType.name,
                ),
                FromField(
                  hint: emailText,
                  validetmsg: emailTextCommend,
                  controllers: emailController,
                  bordercolor: conWhite,
                  keytype: TextInputType.emailAddress,
                ),
                FromField(
                  hint: phoneText,
                  validetmsg: phoneTextCommend,
                  controllers: phoneController,
                  bordercolor: conWhite,
                  keytype: TextInputType.phone,
                ),
                FromField(
                  hint: passwordText,
                  validetmsg: passwordTextCommend,
                  controllers: passwordController,
                  bordercolor: conWhite,
                ),
                Padding(
                  padding: pTRL20,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          usersentotp(
                              passwordController.text,
                              nameController.text,
                              emailController.text,
                              phoneController.text,
                              context);
                        }
                      },
                      style: signup,
                      child: Text(signUp, style: shortTextW),
                    ),
                  ),
                ), //--------------------------------------------------------signupButton----------------------------------------------

                conHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      alreadyCommend,
                      style: shortTextW,
                    ),
                    conWidth10,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserLoginScreen(),
                            ));
                      },
                      child: Text(
                        login,
                        style: minTextG,
                      ),
                    ),
                  ],
                ),
                conHeight20,
              ]),
        ),
      )),
    );
  }
}
