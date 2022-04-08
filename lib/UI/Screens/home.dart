import 'package:card_swiper/card_swiper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/UI.dart';
import 'package:mbh/UI/Widgets/cardswiper.dart';
import 'package:mbh/UI/Widgets/gpscard.dart';
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
            SizedBox(
              height: 8.0,
            ),
            TitleBar(),
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: 450.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "https://via.placeholder.com/196x196",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 10,
                itemWidth: 196.0,
                itemHeight: 196.0,
                viewportFraction: 0.8,
                layout: SwiperLayout.TINDER,
                pagination: null,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container bottomNavigationBarBuilder() {
    return Container(
      decoration: BoxDecoration(color: inColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(icon: SvgPicture.asset('assets/icons/food.svg'), title: Text("explorer"), selectedColor: mainColor, unselectedColor: greyColor),
          SalomonBottomBarItem(icon: SvgPicture.asset('assets/icons/ordre.svg'), title: Text("commandes"), selectedColor: mainColor, unselectedColor: greyColor),
          SalomonBottomBarItem(icon: SvgPicture.asset('assets/icons/account.svg'), title: Text("profil"), selectedColor: mainColor, unselectedColor: greyColor),
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
