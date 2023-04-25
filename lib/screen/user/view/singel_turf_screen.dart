import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/user/controller/single_turfget.dart';
import '../../../core/h_w.dart';
import '../model/single_turf_get.dart';

class OneOneTurfPage extends StatelessWidget {
  final String id;

  const OneOneTurfPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<SingleCourt>(
      future: fetchSingleCourts(id),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Could not fetch data'));
        } else {
          final courts = snapshot.data!;
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double maxHeight = constraints.maxHeight;
              final double maxWidth = constraints.maxWidth;
              return Stack(
                children: [
                  Container(
                    height: maxHeight / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(courts.images[0]['location']),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: maxHeight * 0.090,
                              backgroundImage:
                                  NetworkImage(courts.images[1]['location']),
                            ),
                            SizedBox(height: maxHeight * 0.02),
                            Text(
                              courts.courtName,
                              style: TextStyle(
                                fontSize: maxWidth * 0.07,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.location_on, size: 16),
                                const SizedBox(width: 5),
                                Padding(
                                  padding: p10,
                                  child: Text(
                                    '${courts.district},${courts.location}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                                      Icon(Icons.av_timer_rounded),
                                      SizedBox(width: 8),
                                      Text(
                                        'Time',
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
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Card(
                              child: Padding(
                                padding: p10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Details",
                                      style: TextStyle(
                                        color: conGrey,
                                        fontSize: maxWidth * 0.060,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    conHeight20,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Location :- ',
                                          style: richTextXLstyle(maxWidth),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: SizedBox(
                                            child: Text(
                                              ' ${courts.state}, ${courts.district}, ${courts.location}, ${courts.locationDetails}',
                                              style: richTextstyle(maxWidth),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Contact :- ',
                                        style: richTextXLstyle(maxWidth),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ${courts.mobile}',
                                            style: richTextMstyle(maxWidth),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Email :- ',
                                        style: richTextXLstyle(maxWidth),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ${courts.email}',
                                            style: richTextMstyle(maxWidth),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Event Type :- ',
                                        style: richTextXLstyle(maxWidth),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ${courts.event}',
                                            style: richTextMstyle(maxWidth),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Court Fee :- ',
                                        style: richTextXLstyle(maxWidth),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ${courts.price} ',
                                            style: richTextMstyle(maxWidth),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Holiday :- ',
                                        style: richTextXLstyle(maxWidth),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ${courts.holiday} ',
                                            style: richTextMstyle(maxWidth),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
          );
        }
      },
    ));
  }
}
