import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/user/controller/user_login.dart';
import '../../../widget/from_filde.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conBlack,
      appBar: AppBar(
        title: Text(login),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
                child: SizedBox(
              child: Lottie.asset('assets/Lottie/dlf10_KtZi3gfvBz.json'),
            )),
            Container(
              padding: pTRL20,
              child: Text(
                tapCommend,
                style: mainTextG,
              ),
            ),
            FromField(
              keytype: TextInputType.emailAddress,
              hint: emailText,
              validetmsg: emailTextCommend,
              controllers: emailController,
              bordercolor: conWhite,
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
                      userlogi(passwordController.text, emailController.text,
                          context);
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
