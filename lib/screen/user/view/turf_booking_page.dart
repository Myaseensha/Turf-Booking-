import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/user/controller/slot_booking.dart';
import 'package:turf/widget/button.dart';
import '../model/booking_model.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key, required this.tokenid});
  String tokenid;
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
                  padding: pR20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromARGB(205, 158, 158, 158),
                            width: 1.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.d().format(date),
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        conHeight10,
                        Text(
                          DateFormat.MMM().format(date),
                          style: TextStyle(
                            color: Colors.grey.shade800,
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
                            width: 1.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Padding(
                        padding: pRL20,
                        child: Text(
                          time,
                          style: TextStyle(
                            color: conBlack,
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
              final body = {
                'slot_time': '2023-04-25 12:00:00',
                'slot_duration': '60 minutes'
              };
              final prefs = await SharedPreferences.getInstance();
              final token = prefs.getString('token');
              bookSlot("$token", body);
            },
            title: 'Book Slote',
          ),
        ],
      ),
    );
  }
}
