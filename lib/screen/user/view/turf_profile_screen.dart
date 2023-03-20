import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/padding.dart';

class TurfProfileSceen extends StatelessWidget {
  const TurfProfileSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cblack,
      body: SafeArea(
        child: ListView.separated(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: pL40,
              child: Container(
                alignment: Alignment.center,
                height: 120,
                decoration: BoxDecoration(
                  color: Cwhite,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(60),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'Club One',
                    style: minTextG,
                  ),
                  leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/image/th (7).webp')),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Cheight10;
          },
        ),
      ),
    );
  }
}
