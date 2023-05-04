import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/screen/turfadd/controller/turf_update.dart';
import '../../../core/padding.dart';
import '../../../widget/from_filde.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TurfUpdate extends StatefulWidget {
  TurfUpdate(
      {super.key,
      required this.email,
      required this.mobile,
      required this.price,
      required this.locatiion,
      required this.turfname,
      required this.holiday,
      required this.token});
  String token;
  String email;
  String mobile;
  String price;
  String locatiion;
  String turfname;
  String holiday;
  @override
  State<TurfUpdate> createState() => _TurfUpdateState();
}

class _TurfUpdateState extends State<TurfUpdate> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey();

  late TextEditingController emailController;

  late TextEditingController turfnameController;

  late TextEditingController numberController;

  late TextEditingController holidayController;

  late TextEditingController locationController;
  late TextEditingController priceController;
  @override
  void initState() {
    emailController = TextEditingController(text: widget.email);
    turfnameController = TextEditingController(text: widget.turfname);
    holidayController = TextEditingController(text: widget.holiday);
    locationController = TextEditingController(text: widget.locatiion);
    numberController = TextEditingController(text: widget.mobile);
    priceController = TextEditingController(text: widget.price);
    super.initState();
  }

  DateTime _startTime = DateFormat('HH:mm').parse("10:00");
  DateTime _endTime = DateFormat('HH:mm').parse("10:00");

  void _selectStartTime() {
    DatePicker.showTimePicker(
      context,
      showSecondsColumn: false,
      onConfirm: (dateTime) {
        setState(() {
          _startTime = dateTime;
        });
      },
    );
  }

  void _selectEndTime() {
    DatePicker.showTimePicker(
      context,
      showSecondsColumn: false,
      onConfirm: (dateTime) {
        setState(() {
          _endTime = dateTime;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: conWhite,
      appBar: AppBar(
        title: Text("Update your turf"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FromField(
                  bordercolor: conGrey,
                  hint: turfnameText,
                  validetmsg: nameTextCommend,
                  controllers: turfnameController,
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: emailText,
                  keytype: TextInputType.emailAddress,
                  validetmsg: emailTextCommend,
                  controllers: emailController,
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: phoneText,
                  textleangthe: 10,
                  keytype: TextInputType.number,
                  validetmsg: phoneTextCommend,
                  controllers: numberController,
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: "Holiday",
                  textleangthe: 10,
                  keytype: TextInputType.text,
                  validetmsg: "Please enter holiday",
                  controllers: holidayController,
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: "Location",
                  textleangthe: 10,
                  keytype: TextInputType.text,
                  validetmsg: "Please enter Location",
                  controllers: locationController,
                ),
                FromField(
                  bordercolor: conGrey,
                  hint: "Price",
                  textleangthe: 10,
                  keytype: TextInputType.number,
                  validetmsg: "Please enter price",
                  controllers: priceController,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: _selectStartTime,
                        child: Text(
                          _startTime != null
                              ? 'Open Time: ${_startTime.hour}:${_startTime.minute}'
                              : 'Select Start Time',
                          style: TextStyle(overflow: TextOverflow.fade),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: _selectEndTime,
                        child: Text(_endTime != null
                            ? 'Colse Time: ${_endTime.hour}:${_endTime.minute}'
                            : 'Select End Time'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: pTRL20,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final data = {
                          "courtName": turfnameController.text,
                          "email": emailController.text,
                          "mobile": numberController.text,
                          "loction_Details": locationController.text,
                          "Price": int.parse(priceController.text),
                          "Holiday": holidayController.text,
                          // "closingTime": _endTime.toString(),
                          // "openingTime": _startTime.toString(),
                        };
                        await turfUpdate(widget.token, data, context);
                      },
                      style: signup,
                      child: Text("Update", style: shortTextW),
                    ),
                  ),
                ),
              ]),
        ),
      )),
    );
  }
}
