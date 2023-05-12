import 'package:flutter/material.dart';
import 'package:turf/screen/user/view/turf_details.dart';

import '../../../core/color.dart';
import '../../../core/padding.dart';
import '../controller/reviwe_get.dart';
import '../model/review_model.dart';
import '../model/single_turf_get.dart';
import 'review_card.dart';
import 'turf_button.dart';

Container singelTurfBottomSide(
    {required double maxHeight,
    required SingleCourt courts,
    required double maxWidth,
    required BuildContext context,
    required String id,
    required TabController tabController}) {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
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
            turfRowButtons(maxWidth, maxHeight, courts, context, id),
          ],
        ),
        SizedBox(height: maxHeight * 0.02),
        Padding(
          padding: pRL10,
          child: SizedBox(
            height: 30,
            child: TabBar(
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              controller: tabController,
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
            controller: tabController,
            children: [
              SingleChildScrollView(
                child: turfDetailsCard(maxWidth, courts),
              ),
              FutureBuilder<List<ReviewGet>>(
                future: reviewGet(id),
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
                    return Text("Failed to fetch reviews: ${snapshot.error}");
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ],
    ),
  );
}
