import 'package:flutter/material.dart';

Color mainColor = Color(0xFFE13D3B);
Color inColor = Color(0xFFFFFFFF);
Color backColor = Color(0xFFf5f5f5);
Color frontColor = Color(0xFF000000);
Color greyColor = Color(0xFFC4C4C4);

TextStyle textStyleSmall = TextStyle(fontSize: 13.0);
TextStyle textStyleSouSimple = TextStyle(fontSize: 15.0);
TextStyle textStyleSimple = TextStyle(fontSize: 17.0);
TextStyle textStyleSouTitle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500);
TextStyle textStyleTitle =
    TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900);

BorderRadius radius = BorderRadius.all(Radius.circular(30));

List<String> examples = [
  "assets/proto/exp1.png",
  "assets/proto/exp2.png",
  "assets/proto/exp3.png",
  "assets/proto/exp4.png",
];

List<String> examplesNames = [
  "Super Plat",
  "plat healthy",
  "tajin el zitoun",
  "baklawa"
];

List<BoxShadow> navigationBarShadows = [
  BoxShadow(
      offset: Offset(0, -4), blurRadius: 5.0, color: Colors.black.withAlpha(25))
];

List<BoxShadow> shadows = [
  BoxShadow(
      offset: Offset(0, 0), blurRadius: 3.0, color: Colors.black.withAlpha(25))
];

int prixtotal = 200;
