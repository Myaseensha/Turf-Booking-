import 'package:flutter/material.dart';
import 'package:turf/core/hard_text.dart';
import '../../../core/color.dart';
import '../../../core/padding.dart';
import '../../../widget/from_filde.dart';

class TurfProfileAdd extends StatelessWidget {
  TurfProfileAdd(
      {super.key,
      required this.email,
      required this.mobile,
      required this.password});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final String mobile;
  final String email;
  final String password;

  final TextEditingController stateController = TextEditingController();
  final TextEditingController districController = TextEditingController();
  final TextEditingController nearsteLocationController =
      TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(addTurfCommend),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              // Container(
              //   padding: pTRL20,
              //   child: Text(
              //     addTurfCommend,
              //     style: mainTextG,
              //   ),
              // ),
              FromField(
                bordercolor: conGrey,
                hint: locationText,
                keytype: TextInputType.emailAddress,
                validetmsg: locationTextCommend,
                controllers: locationController,
              ),
              FromField(
                bordercolor: conGrey,
                hint: stateText,
                keytype: TextInputType.number,
                validetmsg: locationTextCommend,
                controllers: stateController,
              ),
              FromField(
                bordercolor: conGrey,
                hint: districText,
                keytype: TextInputType.number,
                validetmsg: locationTextCommend,
                controllers: districController,
              ),
              FromField(
                bordercolor: conGrey,
                hint: locationNearText,
                keytype: TextInputType.number,
                validetmsg: locationTextCommend,
                controllers: nearsteLocationController,
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
                        return;
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
