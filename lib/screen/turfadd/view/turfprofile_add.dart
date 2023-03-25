import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import '../../../core/color.dart';
import '../../../core/padding.dart';
import '../../../widget/from_filde.dart';
import '../controller/image_provider.dart';
import '../controller/turf_add.dart';
import '../model/turf_add.dart';

class TurfProfileAdd extends StatelessWidget {
  TurfProfileAdd(
      {super.key,
      required this.courtName,
      required this.email,
      required this.mobile,
      required this.password});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final String mobile;
  final String email;
  final String password;
  final String courtName;
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districController = TextEditingController();
  final TextEditingController nearsteLocationController =
      TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final courtProvider = Provider.of<CourtProvider>(context);
    final image1 =
        courtProvider.image != null ? FileImage(courtProvider.image!) : null;
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
              conHeight20,
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                foregroundImage: image1,
                child: IconButton(
                  onPressed: () async {
                    final pickedFile = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                      maxWidth: 500,
                      maxHeight: 500,
                    );
                    if (pickedFile != null) {
                      courtProvider.setImage(File(pickedFile.path));
                    }
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
              ),
              FromField(
                bordercolor: conGrey,
                hint: locationText,
                keytype: TextInputType.name,
                validetmsg: locationTextCommend,
                controllers: locationController,
              ),
              FromField(
                bordercolor: conGrey,
                hint: stateText,
                keytype: TextInputType.name,
                validetmsg: locationTextCommend,
                controllers: stateController,
              ),
              FromField(
                bordercolor: conGrey,
                hint: districText,
                keytype: TextInputType.name,
                validetmsg: locationTextCommend,
                controllers: districController,
              ),
              FromField(
                bordercolor: conGrey,
                hint: locationNearText,
                keytype: TextInputType.name,
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
                        CourtAdd court = CourtAdd(
                            courtName: courtName,
                            email: email,
                            mobile: mobile,
                            password: password,
                            location: locationController.text,
                            district: districController.text,
                            state: stateController.text,
                            event: eventController.text,
                            locationDetails: nearsteLocationController.text,
                            imageFiles: [
                              image1!.file,
                            ]);
                        createCourt(context, court);
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
