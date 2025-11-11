import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/resources/AssetManager.dart';
import 'package:islami/core/resources/ColorManager.dart';
import 'package:islami/model/SuraModel.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(sura.isEmpty){
      loadFile(suraModel.number);
    }
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        title: Text(
          suraModel.suraNameEn,
          style: TextStyle(
            color: ColorManager.navBarColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: ColorManager.navBarColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetManager.left),
                      Text(
                        suraModel.suraNameAr,
                        style: TextStyle(
                          color: ColorManager.navBarColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Image.asset(AssetManager.right),
                    ],
                  ),
                  Expanded(
                    child: sura.isNotEmpty?SingleChildScrollView(
                      child: Text(sura,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorManager.navBarColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),),
                    )
                        :Center(child: CircularProgressIndicator(color: ColorManager.navBarColor,)),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetManager.bottom),
        ],
      ),
    );
  }

  add(int n1 , int n2){
    return n1 +n2;
  }

  String sura = "";

  loadFile(int number)async{
    add(1,5);
    String suraVerses = await rootBundle.loadString("assets/files/$number.txt");
    List<String> lines =  suraVerses.split("\n");
    for(int i = 0; i<lines.length;i++){
      sura +=lines[i];
      sura+="(${(i+1)})";
    }
    setState(() {

    });
  }
}
