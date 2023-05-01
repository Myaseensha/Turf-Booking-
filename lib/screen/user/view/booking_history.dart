import 'package:flutter/material.dart';

class TurfBookingHistoryPage extends StatelessWidget {
  final List<dynamic> bookings;

  const TurfBookingHistoryPage({Key? key, required this.bookings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
      ),
      body: bookings.isEmpty
          ? const Center(
              child: Text('No bookings found'),
            )
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (BuildContext context, int index) {
                final currentBooking = bookings[index];
                String paymentStatus = currentBooking['payment'];

                Color paymentColor;
                if (paymentStatus == 'Success') {
                  paymentColor = Colors.green;
                } else {
                  paymentColor = Colors.red;
                }

                DateTime bookDate = DateTime.parse(currentBooking['bookDate']);
                String formattedBookDate =
                    "${bookDate.day}/${bookDate.month}/${bookDate.year}";

                String time = currentBooking['time'];
                if (time.isEmpty) {
                  time = 'Unknown';
                }

                String turfName = currentBooking['turf']['name'];
                String courtName = currentBooking['turf']['courtName'];
                String address = currentBooking['turf']['address'];

                return GestureDetector(
                  onTap: () => _showBookingDetails(context, currentBooking),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$turfName - $courtName',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          address,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formattedBookDate,
                              style: const TextStyle(
                                color: Colors.grey,
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
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _showBookingDetails(BuildContext context, dynamic booking) {
    // TODO: Implement booking details screen.
  }
}
