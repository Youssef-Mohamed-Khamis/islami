import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/AppConstans.dart';
import 'package:islami/core/resources/AssetManager.dart';
import 'package:islami/core/resources/ColorManager.dart';
import 'package:islami/core/resources/StringsManager.dart';
import 'package:islami/ui/home/tabs/quran_tab/widgets/RecentlyQuranWidget.dart';
import 'package:islami/ui/home/tabs/quran_tab/widgets/SuraWidget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, right: 20, left: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetManager.quranBack),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(AssetManager.islami, fit: BoxFit.fitHeight)),
          SizedBox(height: 22),
          TextField(
            style: TextStyle(
              color: ColorManager.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              hintText: StringsManager.suraName,
              hintStyle: TextStyle(
                color: ColorManager.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 56,
                maxWidth: 56,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: SvgPicture.asset(
                  AssetManager.quranSelectedIcon,
                  width: 28,
                  height: 28,
                  color: ColorManager.navBarColor,
                ),
              ),
              filled: true,
              fillColor: ColorManager.background.withOpacity(0.7),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorManager.navBarColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorManager.navBarColor,
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringsManager.mostRecently,
              style: TextStyle(
                color: ColorManager.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: ( context , index) => RecentlyQuranWidget(),
                separatorBuilder: ( context , index) => SizedBox(width: 10,),
                itemCount: 10
            ),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringsManager.suraList,
              style: TextStyle(
                color: ColorManager.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.separated(
                itemBuilder: (context,index) => SuraWidget(suras[index]),
                separatorBuilder: (context,index) =>Divider(color: ColorManager.navBarColor,),
                itemCount: suras.length
            ),
          ),
        ],
      ),
    );
  }
}
