import 'package:flutter/material.dart';

import '../model/turf_get.dart';

class TurfProvider extends ChangeNotifier {
  final List<Court> _courts = [];
  List<Court> _filteredCourts = [];

  Future<void> fetchCourts() async {
    _filteredCourts = _courts;
    notifyListeners();
  }

  List<Court> get filteredCourts => _filteredCourts;

  void filterCourts(String query) {
    if (query.isEmpty) {
      _filteredCourts = _courts;
    } else {
      _filteredCourts = _courts
          .where((court) =>
              court.courtName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
