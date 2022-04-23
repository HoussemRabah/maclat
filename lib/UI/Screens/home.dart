import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Core/examples.dart';
import 'package:mbh/Logic/Modules/UI.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Widgets/cards/cardswiper.dart';
import 'package:mbh/UI/Widgets/cards/foodcard.dart';
import 'package:mbh/UI/Widgets/ess/foodtinder.dart';
import 'package:mbh/UI/Widgets/ess/gpscard.dart';
import 'package:mbh/UI/Widgets/cards/storecard.dart';
import 'package:mbh/UI/Widgets/ess/titlebar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: appBarBuilder(),
      bottomNavigationBar: bottomNavigationBarBuilder(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GpsCard(),
            CardSwiper(cards: [
              CardSwip(url: "http://via.placeholder.com/300x200"),
              CardSwip(url: "http://via.placeholder.com/300x200"),
              CardSwip(url: "http://via.placeholder.com/300x200"),
              CardSwip(url: "http://via.placeholder.com/300x200"),
            ]),
            TitleBar(title: "explorer", button: "afficher plus"),
            FoodTinder(),
            TitleBar(title: "recommandé", button: "afficher plus"),
            ListView.builder(
              itemBuilder: (context, index) => FoodCard(
                food: foodExamples[index],
                label: true,
              ),
              itemCount: foodExamples.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
            TitleBar(title: "restaurants", button: "afficher tous"),
            ListView.builder(
              itemBuilder: (context, index) => StoreCard(
                store: storesExamples[index],
              ),
              itemCount: storesExamples.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomNavigationBarBuilder() {
    return Container(
      decoration: BoxDecoration(
          color: inColor,
          boxShadow: navigationBarShadows,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
              icon: SvgPicture.asset('assets/icons/food.svg'),
              title: Text("explorer"),
              selectedColor: mainColor,
              unselectedColor: greyColor),
          SalomonBottomBarItem(
              icon: SvgPicture.asset('assets/icons/ordre.svg'),
              title: Text("commandes"),
              selectedColor: mainColor,
              unselectedColor: greyColor),
          SalomonBottomBarItem(
              icon: SvgPicture.asset('assets/icons/account.svg'),
              title: Text("profil"),
              selectedColor: mainColor,
              unselectedColor: greyColor),
        ],
      ),
    );
  }

  AppBar appBarBuilder() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: mainColor),
      backgroundColor: backColor,
      foregroundColor: frontColor,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        "Maclat",
        style: textStyleTitle.copyWith(color: mainColor),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset("assets/icons/menu.svg"),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset("assets/icons/search.svg"),
        ),
      ],
    );
  }
}
