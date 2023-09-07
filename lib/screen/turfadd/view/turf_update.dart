import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/screen/turfadd/controller/turf_update.dart';
import '../../../core/padding.dart';
import '../../../widget/from_filde.dart';

// ignore: must_be_immutable
class TurfUpdate extends StatefulWidget {
  TurfUpdate({
    Key? key,
    required this.email,
    required this.mobile,
    required this.price,
    required this.locatiion,
    required this.turfname,
    required this.holiday,
    required this.token,
    required this.closingTime,
    required this.openingTime,
  }) : super(key: key);

  String token;
  String email;
  String mobile;
  String price;
  String locatiion;
  String turfname;
  String holiday;
  String closingTime;
  String openingTime;

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
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void initState() {
    emailController = TextEditingController(text: widget.email);
    turfnameController = TextEditingController(text: widget.turfname);
    holidayController = TextEditingController(text: widget.holiday);
    locationController = TextEditingController(text: widget.locatiion);
    numberController = TextEditingController(text: widget.mobile);
    priceController = TextEditingController(text: widget.price);
    _startTime = DateTime.parse(widget.openingTime);
    _endTime = DateTime.parse(widget.closingTime);
    super.initState();
  }

  Future<void> _selectStartTime() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _startTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _startTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          _startTime.hour,
          _startTime.minute,
        );
      });
    }
  }

  Future<void> _selectEndTime() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _endTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _endTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          _endTime.hour,
          _endTime.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: conWhite,
      appBar: AppBar(
        title: const Text("Update your turf"),
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
                const SizedBox(height: 10),
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
                          style: const TextStyle(overflow: TextOverflow.fade),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          "closingTime": _endTime.toString(),
                          "openingTime": _startTime.toString(),
                        };
                        await turfUpdate(widget.token, data, context);
                      },
                      style: signup,
                      child: Text("Update", style: shortTextW),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
