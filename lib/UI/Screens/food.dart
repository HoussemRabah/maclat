import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Decoration/covers.dart';
import 'package:mbh/UI/Widgets/appbar.dart';
import 'package:mbh/UI/Widgets/checkedline.dart';
import 'package:mbh/UI/Widgets/panier.dart';
import 'package:blur/blur.dart';
import 'package:mbh/UI/Widgets/storecard.dart';
import 'package:mbh/UI/Widgets/titlebar.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: inColor,
        bottomNavigationBar: buildNavigationBar(),
        floatingActionButton: Panier(),
        body: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.topCenter,
          children: [
            backgroundBuilder(context),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        clipBehavior: Clip.none,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: inColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 69.0,
                            ),
                            Text(
                              "pour la santé",
                              style: textStyleSimple,
                            ),
                            CheckLine(text: "pour le diabète"),
                            CheckLine(text: "pour votre regime"),
                            Text(
                              "Fourni par",
                              style: textStyleSimple,
                            ),
                            StoreCard(
                                store: Store(name: "fares food", rate: "2.5")),
                            Text(
                              "Déscription",
                              style: textStyleSimple,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                              style:
                                  textStyleSouSimple.copyWith(color: greyColor),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: -69 / 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 69,
                                  width: 69 * 2,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                      borderRadius: radius, color: mainColor),
                                  child: Text(
                                    "200DA",
                                    style: textStyleSimple.copyWith(
                                        color: inColor),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
            ScreenAppBar(),
          ],
        ),
      ),
    );
  }

  Container backgroundBuilder(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Image.asset(
          "assets/proto/exp1.png",
          fit: BoxFit.cover,
        ));
  }

  Container buildNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: navigationBarShadows,
          color: inColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Badge(
            badgeColor: mainColor,
            badgeContent: Text(
              "17",
              style: textStyleSouSimple.copyWith(color: inColor),
            ),
            child: Sqaure(
                child: Icon(
              LineIcons.heart,
              color: greyColor,
              size: 30.0,
            )),
          ),
          SizedBox(
            width: 8.0,
          ),
          Badge(
            badgeColor: mainColor,
            badgeContent: Text(
              "20",
              style: textStyleSouSimple.copyWith(color: inColor),
            ),
            child: Sqaure(
                child: Icon(
              LineIcons.comment,
              color: greyColor,
              size: 30.0,
            )),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Container(
              height: 69.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: radius, color: mainColor),
              padding: EdgeInsets.all(8.0),
              child: Text(
                "commander",
                style: textStyleSimple.copyWith(color: inColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
