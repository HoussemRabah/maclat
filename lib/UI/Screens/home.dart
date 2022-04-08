import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbh/Core/constants.dart';
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
      bottomNavigationBar: BottomNavigationBarBuilder(),
      body: Column(
        children: [
          Swiper(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                "https://via.placeholder.com/350x150",
                fit: BoxFit.fill,
              );
            },
            autoplay: true,
            pagination: SwiperPagination.dots,
          )
        ],
      ),
    );
  }

  Container BottomNavigationBarBuilder() {
    return Container(
      decoration: BoxDecoration(
          color: inColor,
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
