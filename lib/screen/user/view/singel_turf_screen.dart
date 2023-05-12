import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:turf/screen/user/controller/single_turfget.dart';
import 'package:turf/screen/user/controller/user_details_get.dart';
import '../model/single_turf_get.dart';
import 'singe_turf_bottom.dart';

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
                    child: singelTurfBottomSide(
                      context: context,
                      courts: courts,
                      maxHeight: maxHeight,
                      maxWidth: maxWidth,
                      tabController: _tabController,
                      id: widget.id,
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
