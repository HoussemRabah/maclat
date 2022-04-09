import 'package:badges/badges.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/UI.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Widgets/cardswiper.dart';
import 'package:mbh/UI/Widgets/foodcard.dart';
import 'package:mbh/UI/Widgets/foodtinder.dart';
import 'package:mbh/UI/Widgets/gpscard.dart';
import 'package:mbh/UI/Widgets/storelabel.dart';
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
          ],
        ),
      ),
    );
  }

  Container bottomNavigationBarBuilder() {
    return Container(
      decoration: BoxDecoration(
          color: inColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                spreadRadius: 3.0,
                offset: Offset(0, -4),
                color: Color(0x44000000))
          ],
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
