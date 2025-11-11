
import 'package:flutter/material.dart';
import 'package:islami/core/resources/AssetManager.dart';
import 'package:islami/core/resources/ColorManager.dart';

class RecentlyQuranWidget extends StatelessWidget {
  const RecentlyQuranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.navBarColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 20,
              left: 17
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Al-Anbiya",style: TextStyle(
                  color: ColorManager.background,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),),
                Text("الانبياء",style: TextStyle(
                  color: ColorManager.background,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),),
                Text("122 Verses",style: TextStyle(
                  color: ColorManager.background,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),),
              ],
            ),
          ),
          Image.asset(AssetManager.mostRecently)
        ],
      ),
    );
  }
}
