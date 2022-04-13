import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/UI.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Widgets/cardswiper.dart';
import 'package:mbh/UI/Widgets/foodcard.dart';
import 'package:mbh/UI/Widgets/foodtinder.dart';
import 'package:mbh/UI/Widgets/gpscard.dart';
import 'package:mbh/UI/Widgets/storecard.dart';
import 'package:mbh/UI/Widgets/titlebar.dart';
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
            FoodCard(
                food: Food(
                    name: "Tajin el ziton",
                    price: "200DA",
                    disc: "olives, viande et poulet",
                    image: "assets/proto/exp3.png",
                    store: Store(name: "HomeFood Resto", rate: "3.4"))),
            FoodCard(
                food: Food(
                    name: "Baklawa",
                    price: "90DA pour 1",
                    disc: "Délicieux baklava d'un professionnel",
                    image: "assets/proto/exp4.png",
                    store: Store(name: "omRamy Sweet", rate: "4.2"))),
            TitleBar(title: "restaurants", button: "afficher tous"),
            StoreCard(
              store: Store(name: "FaresFood", rate: "3.5"),
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
      backgroundColor: backColor,
      foregroundColor: frontColor,
      elevation: 0.0,
      title: Text(
        "Maclat",
        style: textStyleSimple.copyWith(color: mainColor),
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
