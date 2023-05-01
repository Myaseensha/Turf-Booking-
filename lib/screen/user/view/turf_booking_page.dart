import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/user/controller/bookign_failde.dart';
import 'package:turf/screen/user/controller/booking_success.dart';
import 'package:turf/screen/user/controller/slot_booking.dart';
import 'package:turf/widget/button.dart';
import '../model/booking_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class BookingPage extends StatefulWidget {
  BookingPage(
      {super.key,
      required this.tokenid,
      required this.email,
      required this.number,
      required this.userName,
      required this.fee});
  String tokenid;
  String email;
  String number;
  String userName;
  double fee;
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int? selectedDateIndex;
  int? selectedtimeIndex;
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  openCheckout(String email, String number, String userName, int fee) async {
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': fee,
      'name': userName,
      'description': 'Payment',
      'prefill': {'contact': number, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e as String?);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final bookingId = prefs.getString('bookingId');
    print(token);
    print(bookingId);
    await bookingSuccess(token.toString(), bookingId.toString(), context);
    print("....................................................$bookingId");
    print(token);
    print(bookingId);
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final bookingId = prefs.getString('bookingId');
    print(token);
    print(bookingId);
    await bookingFailed(bookingId.toString(), token.toString());
    log("....................................................$bookingId");
    print(token);
    print(bookingId);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName}", timeInSecForIosWeb: 4);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final dateModel = Provider.of<DateModel>(context);
    final timeModel = Provider.of<TimeModel>(context);
    return Padding(
      padding: p10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          conHeight10,
          conHeight20,
          Text(
            "Date",
            style: TextStyle(
              fontSize: 20,
              color: conWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          conHeight20,
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dateModel.dates.length,
              itemBuilder: (BuildContext context, int index) {
                DateTime date = dateModel.dates[index];
                Color color = Colors.white;
                if (date.weekday == DateTime.saturday ||
                    date.weekday == DateTime.sunday) {
                  color = Colors.grey.shade600;
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: color,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(205, 158, 158, 158),
                            width: 1.7),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      dateModel.setSelectedDate(date);
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.d().format(date),
                          style: TextStyle(
                            color: selectedDateIndex == index
                                ? Colors.red
                                : Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          DateFormat.MMM().format(date),
                          style: TextStyle(
                            color: selectedDateIndex == index
                                ? Colors.red
                                : Colors.grey.shade800,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          conHeight20,
          Text(
            "Times",
            style: TextStyle(
              fontSize: 20,
              color: conWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          conHeight20,
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timeModel.times.length,
              itemBuilder: (BuildContext context, int index) {
                String time = timeModel.times[index];
                return Padding(
                  padding: pR10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromARGB(205, 158, 158, 158),
                          width: 1.7,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      timeModel.setSelectedTime(time);
                      setState(() {
                        selectedtimeIndex = index;
                      });
                    },
                    child: Center(
                      child: Padding(
                        padding: pRL20,
                        child: Text(
                          time,
                          style: TextStyle(
                            color: selectedtimeIndex == index
                                ? Colors.red
                                : Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Button(
            style: minTextG,
            colorB: conWhite,
            colorF: conGreen,
            onpress: () async {
              final selectedDate = dateModel.selectedDate;
              final selectedTime = timeModel.selectedTime;
              final body = {
                'date': selectedDate.toString(),
                'time': selectedTime,
                'turf': widget.tokenid
              };
              final prefs = await SharedPreferences.getInstance();
              final token = prefs.getString('token');
              final resulte = await bookSlot(
                token.toString(),
                body,
                context,
              );
              if (resulte == true) {
                openCheckout(widget.email, widget.number, widget.userName,
                    widget.fee.toInt());
              }
            },
            title: 'Book Slote',
          ),
        ],
      ),
    );
  }
}
