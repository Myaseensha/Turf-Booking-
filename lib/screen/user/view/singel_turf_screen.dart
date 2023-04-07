import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class OneOneTurfPage extends StatelessWidget {
  const OneOneTurfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double maxHeight = constraints.maxHeight;
          final double maxWidth = constraints.maxWidth;

          return Stack(
            children: [
              Container(
                height: maxHeight / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/artificial_turf_nw.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: maxHeight * 0.25,
                  left: maxWidth * 0.05,
                  right: maxWidth * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: maxHeight * 0.090,
                      backgroundImage: const AssetImage(
                        'assets/image/th (7).webp',
                      ),
                    ),
                    SizedBox(height: maxHeight * 0.02),
                    Text(
                      'Turf Admin',
                      style: TextStyle(
                        fontSize: maxWidth * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on, size: 16),
                        SizedBox(width: 5),
                        Text(
                          'malappuram , kummana',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: maxHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.money),
                              SizedBox(width: 8),
                              Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 8),
                              Text(
                                'Book',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: maxHeight * 0.05),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: maxHeight * 0.6,
                          child: TableCalendar(
                            calendarStyle: const CalendarStyle(
                              todayDecoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            headerStyle: const HeaderStyle(
                              formatButtonVisible: false,
                            ),
                            firstDay: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            lastDay:
                                DateTime.now().add(const Duration(days: 365)),
                            focusedDay: DateTime.now(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
