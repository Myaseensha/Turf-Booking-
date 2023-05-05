// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/user/controller/single_turfget.dart';
import 'package:turf/screen/user/controller/turf_get.dart';
import 'package:turf/screen/user/model/turf_get.dart';
import 'package:turf/screen/user/view/singel_turf_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../widget/category_button.dart';
import '../../../widget/search_bar.dart';

class TurfProfileSceen extends StatefulWidget {
  const TurfProfileSceen({Key? key}) : super(key: key);

  @override
  _TurfProfileSceenState createState() => _TurfProfileSceenState();
}

class _TurfProfileSceenState extends State<TurfProfileSceen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              searchQuery: searchQuery,
              onSearchQueryChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryButton(title: 'All'),
                  CategoryButton(title: 'Football'),
                  CategoryButton(title: 'Nearby'),
                  CategoryButton(title: 'Gym'),
                  CategoryButton(title: 'Location'),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Court>>(
                future: fetchCourts(searchQuery),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final courts = snapshot.data!;
                    return ListView.separated(
                      itemCount: courts.length,
                      itemBuilder: (context, index) {
                        final court = courts[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(60),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                conWidth10,
                                ClipOval(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        court.images[0]['location']),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        court.courtName,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on,
                                              size: 16),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${court.district},${court.location}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade400,
                                        thickness: 2,
                                      ),
                                      conHeight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            court.event,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Padding(
                                            padding: pR20,
                                            child: SizedBox(
                                              height: 25,
                                              child: OutlinedButton(
                                                onPressed: () async {
                                                  await fetchSingleCourts(
                                                      court.id);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OneOneTurfPage(
                                                        id: court.id,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                ),
                                                child: const Text(
                                                  'Book',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                    );
                  } else {
                    // shimmer effect
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.separated(
                        itemCount: 10,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Container(
                              height: 120,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(60),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
