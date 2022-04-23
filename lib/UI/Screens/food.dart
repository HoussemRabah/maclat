import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Decoration/covers.dart';
import 'package:mbh/UI/Screens/foodconfig.dart';
import 'package:mbh/UI/Widgets/ess/appbar.dart';
import 'package:mbh/UI/Widgets/label/checkedline.dart';
import 'package:mbh/UI/Widgets/ess/ingr.dart';
import 'package:mbh/UI/Widgets/ess/panier.dart';
import 'package:blur/blur.dart';
import 'package:mbh/UI/Widgets/cards/storecard.dart';
import 'package:mbh/UI/Widgets/ess/titlebar.dart';

class FoodScreen extends StatefulWidget {
  final Food food;
  final bool? fromResto;
  const FoodScreen({Key? key, required this.food, this.fromResto})
      : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: inColor,
        bottomNavigationBar: buildNavigationBar(),
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
                                widget.food.name,
                                style: textStyleTitle,
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Center(
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                alignment: WrapAlignment.center,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  for (Ing ing in widget.food.ings)
                                    IngSqaure(ing: ing),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            if (widget.food.healths != null)
                              Text(
                                "la santé",
                                style: textStyleSimple,
                              ),
                            for (Health health in widget.food.healths ?? [])
                              CheckLine(health: health),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              "Déscription",
                              style: textStyleSimple,
                            ),
                            Text(
                              widget.food.disc,
                              style:
                                  textStyleSouSimple.copyWith(color: greyColor),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            if ((widget.fromResto ?? false) == false)
                              Text(
                                "Fourni par",
                                style: textStyleSimple,
                              ),
                            if ((widget.fromResto ?? false) == false)
                              StoreCard(store: widget.food.store),
                            if ((widget.fromResto ?? false) == false)
                              SizedBox(
                                height: 16.0,
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
                widget.food.price.getPriceString(),
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
          widget.food.image,
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
                    builder: (context) => FoodConfigScreen(food: widget.food)));
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
