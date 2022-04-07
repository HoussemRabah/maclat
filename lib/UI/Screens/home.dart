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
      bottomNavigationBar: Container(
        color: Colors.white,
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
