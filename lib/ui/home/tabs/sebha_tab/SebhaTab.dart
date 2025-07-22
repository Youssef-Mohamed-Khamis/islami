import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/core/resources/AssetManager.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;

  double angel = 0;

  int index = 0;

  List<String> azkar = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
    'لا اله الا الله',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetManager.sebhaBack),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Image.asset(AssetManager.islami, width: 299, fit: BoxFit.fitWidth),
            SizedBox(height: 16),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Image.asset(AssetManager.sebhaTile),
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: onClicked,
                  child: Transform.rotate(
                    angle: angel,
                      child: Image.asset(AssetManager.sebhaBody),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.7,
                  child: Column(
                    children: [
                      Text(
                        azkar[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$counter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onClicked() {
    setState(() {
      counter++;
      angel += 20;
    });
    if (counter % 33 == 0) {
      index++;
    }
    if (index == azkar.length) {
      index = 0;
      counter = 0;
    }
  }
}
