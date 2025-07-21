
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/resources/ColorManager.dart';
import 'package:islami/core/resources/StringsManager.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/HadethTab.dart';
import 'package:islami/ui/home/tabs/quran_tab/QuranTab.dart';
import 'package:islami/ui/home/tabs/radio_tab/RadioTab.dart';
import 'package:islami/ui/home/tabs/sebha_tab/SebhaTab.dart';
import 'package:islami/ui/home/tabs/time_tab/TimeTab.dart';

import '../../../core/resources/AssetManager.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    Timetab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorManager.navBarColor,
          indicatorColor: ColorManager.background.withOpacity(0.6),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: selectedIndex,
          onDestinationSelected: (newIndex){
          setState(() {
            selectedIndex = newIndex;
          });
          },
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(
                    AssetManager.quranIcon
                ),
                label: StringsManager.quran,
                selectedIcon: SvgPicture.asset(AssetManager.quranSelectedIcon),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                  AssetManager.hadethIcon
              ),
              label: StringsManager.hadeth,
              selectedIcon: SvgPicture.asset(AssetManager.hadethSelectedIcon),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                  AssetManager.sebhaIcon
              ),
              label: StringsManager.sebha,
              selectedIcon: SvgPicture.asset(AssetManager.sebhaSelectedIcon),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                  AssetManager.radioIcon
              ),
              label: StringsManager.radio,
              selectedIcon: SvgPicture.asset(AssetManager.radioSelectedIcon),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                  AssetManager.timeIcon
              ),
              label: StringsManager.time,
              selectedIcon: SvgPicture.asset(AssetManager.timeSelectedIcon),
            ),


          ]
      ),
      body: tabs[selectedIndex],
    );
  }
}
