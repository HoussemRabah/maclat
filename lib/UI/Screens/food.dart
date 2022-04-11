import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Decoration/covers.dart';
import 'package:mbh/UI/Screens/foodconfig.dart';
import 'package:mbh/UI/Widgets/appbar.dart';
import 'package:mbh/UI/Widgets/checkedline.dart';
import 'package:mbh/UI/Widgets/ingr.dart';
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
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: inColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 69.0 / 2 + 8.0,
                            ),
                            Center(
                              child: Text(
                                "Plat mélange mini",
                                style: textStyleTitle,
                              ),
                            ),
                            Center(
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                alignment: WrapAlignment.center,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  IngSqaure(
                                      name: "frites",
                                      image: "assets/ing/frite.png"),
                                  IngSqaure(
                                      name: "pomme de terre",
                                      image: "assets/ing/potato.png"),
                                  IngSqaure(
                                      name: "riz",
                                      image: "assets/ing/rice.png"),
                                  IngSqaure(
                                      name: "Viande",
                                      image: "assets/ing/steak.png"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              "la santé",
                              style: textStyleSimple,
                            ),
                            CheckLine(text: "pour le diabète"),
                            CheckLine(text: "pour votre regime"),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              "Fourni par",
                              style: textStyleSimple,
                            ),
                            StoreCard(
                                store: Store(name: "fares food", rate: "2.5")),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              "Déscription",
                              style: textStyleSimple,
                            ),
                            Text(
                              "Un plat composé d'un mélange de viande fraîche chaude et de riz vapeur avec des pommes de terre sautées sans huile et des pommes de terre avec une sauce spéciale du restaurant",
                              style:
                                  textStyleSouSimple.copyWith(color: greyColor),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: -69 / 2, child: centerRowBuilder(context)),
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

  Container centerRowBuilder(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 16.0,
          ),
          Sqaure(
              child: Icon(
            LineIcons.bookmark,
            size: 30,
            color: greyColor,
          )),
          Spacer(),
          Container(
              height: 69,
              width: 69 * 2,
              alignment: Alignment.center,
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(borderRadius: radius, color: mainColor),
              child: Text(
                "200DA",
                style: textStyleSimple.copyWith(color: inColor),
              )),
          Spacer(),
          Badge(
            badgeColor: mainColor,
            badgeContent:
                Text("1h", style: textStyleSmall.copyWith(color: inColor)),
            child: Sqaure(
                child: Icon(
              LineIcons.clock,
              size: 30,
              color: greyColor,
            )),
          ),
          SizedBox(
            width: 16.0,
          ),
        ],
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FoodConfigScreen()));
              },
              child: Container(
                height: 69.0,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: radius, color: mainColor),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "commander",
                  style: textStyleSimple.copyWith(color: inColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
