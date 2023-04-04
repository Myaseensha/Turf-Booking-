import 'package:flutter/material.dart';

import 'package:turf/core/padding.dart';

import '../../../widget/category_button.dart';
import '../../../widget/search_bar.dart';

class TurfProfileSceen extends StatelessWidget {
  const TurfProfileSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryButton(title: 'All'),
                  CategoryButton(title: 'Sports'),
                  CategoryButton(title: 'Clubs'),
                  CategoryButton(title: 'Events'),
                  CategoryButton(title: 'All'),
                  CategoryButton(title: 'Sports'),
                  CategoryButton(title: 'Clubs'),
                  CategoryButton(title: 'Events'),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: pL40,
                    child: Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(60),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: pL10,
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/image/th (7).webp'),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
