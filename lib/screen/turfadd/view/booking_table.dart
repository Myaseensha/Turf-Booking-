import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import '../controller/earningrepot.dart';
import '../model/earning_model.dart';

SingleChildScrollView monthelyBookingTable(BuildContext context, String token) {
  return SingleChildScrollView(
    physics: const ScrollPhysics(),
    child: FutureBuilder<List<EarningReport>>(
      future: earningReport(token, context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 50,
              child: Lottie.asset(
                  'assets/Lottie/36621-sports-app-loading-indicator.json'),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(fontSize: 18),
            ),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text(
              'No data found',
              style: TextStyle(fontSize: 18),
            ),
          );
        } else {
          final earnings = snapshot.data!;
          final dataRows = earnings.map((earning) {
            return DataRow(cells: [
              DataCell(
                Text(
                  DateFormat('MMM dd').format(earning.id),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  earning.count.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  '\$${earning.totalPrice}',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ]);
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Earnings By Month',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: DataTable(
                      columns: const [
                        DataColumn(
                            label: Text('Days',
                                style: TextStyle(color: Colors.blue))),
                        DataColumn(
                            label: Text('Count',
                                style: TextStyle(color: Colors.blue))),
                        DataColumn(
                            label: Text(
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                'Total Price',
                                style: TextStyle(color: Colors.blue))),
                      ],
                      rows: dataRows,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    ),
  );
}
