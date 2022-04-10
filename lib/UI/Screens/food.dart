import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/UI/Decoration/covers.dart';
import 'package:mbh/UI/Widgets/panier.dart';
import 'package:blur/blur.dart';

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
        backgroundColor: backColor,
        bottomNavigationBar: buildNavigationBar(),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: greyColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(
                "assets/proto/exp1.png",
                fit: BoxFit.cover,
              ).blurred(
                overlay: Text(
                  'plat pro',
                  style: textStyleTitle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Sqaure(
                        child: Icon(
                      LineIcons.stepBackward,
                      size: 30.0,
                    )),
                  ),
                  Spacer(),
                  Panier(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildNavigationBar() {
    return Container(
      decoration: BoxDecoration(
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
