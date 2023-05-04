import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/utils/url.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MonthlyReport {
  final String month;
  final int totalPrice;

  MonthlyReport(this.month, this.totalPrice);
}

Future<charts.BarChart> getMonthlyReportChart(String token) async {
  final url = Uri.parse('$baseUrlTurf/turf-graph-data');
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final data = (jsonDecode(response.body)['monthlyReport'] as List)
        .map((e) => MonthlyReport(e['month'], e['totalPrice']))
        .toList();
    final series = [
      charts.Series<MonthlyReport, String>(
        id: 'TotalPrice',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (MonthlyReport report, _) => report.month,
        measureFn: (MonthlyReport report, _) => report.totalPrice,
        data: data,
      )
    ];

    final chart = charts.BarChart(
      series,
      animate: true,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(
        insideLabelStyleSpec: const charts.TextStyleSpec(
          fontSize: 12,
          color: charts.MaterialPalette.white,
          fontWeight: 'bold',
        ),
        outsideLabelStyleSpec: null,
      ),
      defaultRenderer: charts.BarRendererConfig(
        barGroupInnerPaddingPx: 20,
        cornerStrategy: const charts.ConstCornerStrategy(30),
        groupingType: charts.BarGroupingType.groupedStacked,
        strokeWidthPx: 2.0,
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.MaterialPalette.gray.shade400,
            fontSize: 12,
          ),
          lineStyle: charts.LineStyleSpec(
            dashPattern: const [4, 4],
            color: charts.MaterialPalette.gray.shade300,
          ),
        ),
        tickProviderSpec: const charts.BasicNumericTickProviderSpec(
          zeroBound: false,
          dataIsInWholeNumbers: true,
          desiredTickCount: 5,
        ),
      ),
    );

    return chart;
  } else {
    throw Exception('Failed to fetch data');
  }
}
