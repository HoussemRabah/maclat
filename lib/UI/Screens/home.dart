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
            TitleBar(
              title: "recommandé",
              button: "afficher plus",
            ),
            Container(
              height: 200.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "https://via.placeholder.com/250x250",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 10,
                itemWidth: 250.0,
                itemHeight: 250.0,
                viewportFraction: 0.8,
                layout: SwiperLayout.TINDER,
                pagination: null,
              ),
            ),
            TitleBar(title: "recommandé", button: "afficher plus"),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: inColor, borderRadius: radius),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: radius),
                    child: Image.asset(
                      "assets/proto/cardads1.png",
<<<<<<< HEAD
                      width:
                          MediaQuery.of(context).size.width * 0.5 - 16.0 - 32.0,
=======
                      width: MediaQuery.of(context).size.width * 0.5 - 16.0 - 32.0,
>>>>>>> 4094ad5194996cf72e94ba5e9a40da1941ec4ddf
                    ),
                  ),
                ],
              ),
            )
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
<<<<<<< HEAD
            BoxShadow(
                blurRadius: 5.0,
                spreadRadius: 3.0,
                offset: Offset(0, -4),
                color: Color(0xAA000000))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
=======
            BoxShadow(blurRadius: 5.0, spreadRadius: 3.0, offset: Offset(0, -4), color: Color(0xAA000000))
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
>>>>>>> 4094ad5194996cf72e94ba5e9a40da1941ec4ddf
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
