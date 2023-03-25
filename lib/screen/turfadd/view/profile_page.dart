import 'package:flutter/material.dart';

class TurfProfile extends StatelessWidget {
  const TurfProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final double maxHeight = constraints.maxHeight;
          final double maxWidth = constraints.maxWidth;

          return Stack(children: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: maxHeight * 0.090,
                    backgroundImage: const AssetImage('assets/image/th (7).webp'),
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
                    children: const [
                      Icon(Icons.location_on),
                      Text('Malappuram, Kerala'),
                    ],
                  ),
                  SizedBox(height: maxHeight * 0.03),
                  const TabBar(
                    tabs: [
                      Tab(text: 'Dashboard'),
                      Tab(text: 'New Post'),
                    ],
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                  ),
                  SizedBox(height: maxHeight * 0.03),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: const [
                                    Text('Booked'),
                                    Text('10'),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('Cancel'),
                                    Text('2'),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('Total Renew'),
                                    Text('20'),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text('Turf Date')),
                                    DataColumn(
                                        label: Text('Total Working Hours')),
                                    DataColumn(label: Text('Collections')),
                                    DataColumn(label: Text('Profit')),
                                  ],
                                  rows: const [
                                    DataRow(cells: [
                                      DataCell(Text('Jan 1, 2023')),
                                      DataCell(Text('4')),
                                      DataCell(Text('₹ 5000')),
                                      DataCell(Text('₹ 2500')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Jan 2, 2023')),
                                      DataCell(Text('5')),
                                      DataCell(Text('₹ 6000')),
                                      DataCell(Text('₹ 3000')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Jan 3, 2023')),
                                      DataCell(Text('3')),
                                      DataCell(Text('₹ 4000')),
                                      DataCell(Text('₹ 2000')),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Center(
                          child: Text('New Post'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]);
        })));
  }
}
