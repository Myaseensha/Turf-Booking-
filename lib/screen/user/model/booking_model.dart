import 'package:flutter/material.dart';

class DateModel with ChangeNotifier {
  final List<DateTime> _dates = [];

  List<DateTime> get dates => _dates;
  void generateDates() {
    DateTime startDate = DateTime.now();
    DateTime endDate = startDate.add(const Duration(days: 21));

    while (startDate.isBefore(endDate)) {
      _dates.add(startDate);
      startDate = startDate.add(const Duration(days: 1));
    }

    notifyListeners();
  }
}

class TimeModel with ChangeNotifier {
  final List<String> _times = [
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
  ];

  List<String> get times => _times;
}
