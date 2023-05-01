import 'package:flutter/material.dart';

import '../../../core/padding.dart';

class DateModel with ChangeNotifier {
  final List<DateTime> _dates = [];
  DateTime? _selectedDate;

  List<DateTime> get dates => _dates;
  DateTime? get selectedDate => _selectedDate;

  void generateDates() {
    DateTime startDate = DateTime.now();
    DateTime endDate = startDate.add(const Duration(days: 21));

    while (startDate.isBefore(endDate)) {
      _dates.add(startDate);
      startDate = startDate.add(const Duration(days: 1));
    }

    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}

class TimeModel with ChangeNotifier {
  String _selectedTime = '';

  List<String> _times = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
    '7:00 PM',
    '8:00 PM',
    '9:00 PM'
  ];

  String get selectedTime => _selectedTime;
  List<String> get times => _times;

  void setSelectedTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }
}

class UserBookingsSheet extends StatefulWidget {
  final List<dynamic> bookings;
  final VoidCallback onClose;

  const UserBookingsSheet({
    Key? key,
    required this.bookings,
    required this.onClose,
  }) : super(key: key);

  @override
  UserBookingsSheetState createState() => UserBookingsSheetState();
}

class UserBookingsSheetState extends State<UserBookingsSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 16),
          itemCount: widget.bookings.length,
          itemBuilder: (BuildContext context, int index) {
            final currentBooking = widget.bookings[index];
            String paymentStatus = currentBooking['payment'];

            Color paymentColor;
            if (paymentStatus == 'Success') {
              paymentColor = Colors.green;
            } else if (paymentStatus == "Failed") {
              paymentColor = Colors.red;
            } else {
              paymentColor = Colors.blue;
            }

            DateTime bookDate = DateTime.parse(currentBooking['bookDate']);
            String formattedBookDate =
                "${bookDate.day}/${bookDate.month}/${bookDate.year}";

            String time = currentBooking['time'];
            if (time.isEmpty) {
              return const SizedBox.shrink();
            }

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentBooking['turf']['courtName'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedBookDate,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        paymentStatus,
                        style: TextStyle(
                          color: paymentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
