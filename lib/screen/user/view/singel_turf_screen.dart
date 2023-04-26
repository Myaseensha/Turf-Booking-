import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/user/controller/single_turfget.dart';
import 'package:turf/screen/user/view/turf_booking_page.dart';
import '../../../core/bottomsheet_style.dart';

import '../../../widget/button.dart';
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
                    height: maxHeight / 2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(courts.images[1]['location']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: maxHeight * 0.35,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: maxHeight * 0.05),
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
                                  const Icon(Icons.location_on, size: 18),
                                  Padding(
                                    padding: p10,
                                    child: Text(
                                      '${courts.location}, ${courts.district}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: maxHeight * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  fancyfunctionButton(
                                      Colors.red,
                                      0.23,
                                      12,
                                      Icons.location_on_rounded,
                                      maxWidth,
                                      maxHeight,
                                      onpress: () {},
                                      text: "Location"),
                                  fancyfunctionButton(
                                      conGreen,
                                      0.40,
                                      15,
                                      Icons.calendar_today_rounded,
                                      maxWidth,
                                      maxHeight, onpress: () {
                                    showModalBottomSheet(
                                      backgroundColor: conGreen,
                                      shape: roundedRectangleBorder,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SingleChildScrollView(
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.55,
                                            child: BookingPage(
                                              tokenid: id,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }, text: "Book Slots"),
                                  fancyfunctionButton(Colors.orange, 0.23, 12,
                                      Icons.star, maxWidth, maxHeight,
                                      onpress: () {}, text: "Reviews"),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    ListTile(
                                      leading: Icon(Icons.location_pin,
                                          color: conBlack),
                                      title: Text(
                                        'Location',
                                        style: textstyle(maxWidth),
                                      ),
                                      subtitle: Text(
                                          '${courts.state}, ${courts.district}, ${courts.location}, ${courts.locationDetails}',
                                          style: subtextstyle(maxWidth)),
                                    ),
                                    ListTile(
                                      leading:
                                          Icon(Icons.phone, color: conBlack),
                                      title: Text('Contact',
                                          style: textstyle(maxWidth)),
                                      subtitle: Text(courts.mobile,
                                          style: subtextstyle(maxWidth)),
                                    ),
                                    ListTile(
                                      leading:
                                          Icon(Icons.email, color: conBlack),
                                      title: Text('Email',
                                          style: textstyle(maxWidth)),
                                      subtitle: Text(courts.email,
                                          style: subtextstyle(maxWidth)),
                                    ),
                                    ListTile(
                                      leading:
                                          Icon(Icons.event, color: conBlack),
                                      title: Text(
                                        'Event Type',
                                        style: textstyle(maxWidth),
                                      ),
                                      subtitle: Text(courts.event,
                                          style: subtextstyle(maxWidth)),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.attach_money,
                                          color: conBlack),
                                      title: Text('Court Fee',
                                          style: textstyle(maxWidth)),
                                      subtitle: Text('${courts.price}',
                                          style: subtextstyle(maxWidth)),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.calendar_today,
                                          color: conBlack),
                                      title: Text('Holiday',
                                          style: textstyle(maxWidth)),
                                      subtitle: Text(
                                        courts.holiday,
                                        style: subtextstyle(maxWidth),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
