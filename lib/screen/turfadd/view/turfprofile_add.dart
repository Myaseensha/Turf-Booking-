import 'package:flutter/material.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/screen/user/view/turf_profile_screen.dart';

import '../../../core/color.dart';
import '../../../core/padding.dart';
import '../../../widget/from_filde.dart';

class TurfProfileAdd extends StatelessWidget {
  TurfProfileAdd({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController turfnameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController locationspecificController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  addTurfCommend,
                  style: mainTextG,
                ),
              ),
              FromField(
                bordercolor: Cgrey,
                hint: turfnameText,
                validetmsg: nameTextCommend,
                controllers: turfnameController,
              ),
              FromField(
                bordercolor: Cgrey,
                hint: locationText,
                keytype: TextInputType.emailAddress,
                validetmsg: locationTextCommend,
                controllers: locationController,
              ),
              FromField(
                bordercolor: Cgrey,
                hint: locationSpeText,
                keytype: TextInputType.number,
                validetmsg: locationTextCommend,
                controllers: locationspecificController,
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
                        return null;
                      } else {}
                    },
                    style: signup,
                    child: Text(addText, style: shortTextW),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
