import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/user/controller/reviwe_get.dart';
import 'package:turf/screen/user/controller/single_turfget.dart';
import 'package:turf/screen/user/controller/user_details_get.dart';
import 'package:turf/screen/user/model/review_model.dart';
import 'package:turf/screen/user/view/review_card.dart';
import 'package:turf/screen/user/view/review_submitebox.dart';
import 'package:turf/screen/user/view/turf_booking_page.dart';
import '../../../core/bottomsheet_style.dart';
import '../../../widget/button.dart';
import '../model/single_turf_get.dart';
import 'package:url_launcher/url_launcher.dart';

class OneOneTurfPage extends StatefulWidget {
  final String id;

  const OneOneTurfPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<OneOneTurfPage> createState() => _OneOneTurfPageState();
}

class _OneOneTurfPageState extends State<OneOneTurfPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getUserDetails();
    return Scaffold(
        body: FutureBuilder<SingleCourt>(
      future: fetchSingleCourts(widget.id),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SizedBox(
            height: 50,
            child: Lottie.asset(
                'assets/Lottie/36621-sports-app-loading-indicator.json'),
          ));
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
                                      maxHeight, onpress: () async {
                                    String locationName =
                                        "${courts.locationDetails}, ${courts.location}, ${courts.district}";
                                    String url =
                                        'https://www.google.com/maps/search/?api=1&query=$locationName';

                                    // ignore: deprecated_member_use
                                    if (await canLaunch(url)) {
                                      // ignore: deprecated_member_use
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  }, text: "Location"),
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
                                              tokenid: widget.id,
                                              email: courts.email,
                                              number: courts.mobile,
                                              userName: courts.courtName,
                                              fee: courts.price * 100,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }, text: "Book Slots"),
                                  fancyfunctionButton(Colors.orange, 0.23, 12,
                                      Icons.star, maxWidth, maxHeight,
                                      ratings: courts.rating
                                          .toStringAsFixed(1)
                                          .toString(), onpress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => ReviewDialog(
                                        id: widget.id,
                                      ),
                                    );
                                  }, text: "Review"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: maxHeight * 0.02),
                          Padding(
                            padding: pRL10,
                            child: SizedBox(
                              height: 30,
                              child: TabBar(
                                labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                controller: _tabController,
                                labelColor: conGreen,
                                unselectedLabelColor: Colors.black,
                                tabs: const [
                                  Tab(
                                    text: 'Turf Details',
                                  ),
                                  Tab(
                                    text: 'Reviews',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                SingleChildScrollView(
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        GestureDetector(
                                          onTap: () {
                                            // ignore: deprecated_member_use
                                            launch("tel:${courts.mobile}");
                                          },
                                          child: ListTile(
                                            leading: Icon(Icons.phone,
                                                color: conBlack),
                                            title: Text('Contact',
                                                style: textstyle(maxWidth)),
                                            subtitle: Text(courts.mobile,
                                                style: subtextstyle(maxWidth)),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // ignore: deprecated_member_use
                                            launch("mailto:${courts.email}");
                                          },
                                          child: ListTile(
                                            leading: Icon(Icons.email,
                                                color: conBlack),
                                            title: Text('Email',
                                                style: textstyle(maxWidth)),
                                            subtitle: Text(courts.email,
                                                style: subtextstyle(maxWidth)),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.event,
                                              color: conBlack),
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
                                FutureBuilder<List<ReviewGet>>(
                                  future: reviewGet(widget.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final reviews = snapshot.data!;
                                      return ListView.builder(
                                        itemCount: reviews.length,
                                        itemBuilder: (context, index) {
                                          final review = reviews[index];
                                          return ReviewCard(
                                            username: review.user,
                                            review: review.review,
                                            rating: review.rating,
                                          );
                                        },
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          "Failed to fetch reviews: ${snapshot.error}");
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                )
                              ],
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
