import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Widgets/appbar.dart';
import 'package:mbh/UI/Widgets/config.dart';
import 'package:mbh/UI/Widgets/panier.dart';

class FoodConfigScreen extends StatefulWidget {
  const FoodConfigScreen({Key? key}) : super(key: key);

  @override
  State<FoodConfigScreen> createState() => _FoodConfigScreenState();
}

class _FoodConfigScreenState extends State<FoodConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        floatingActionButton: Panier(),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
                  child: Image.asset(
                    "assets/proto/exp1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                ScreenAppBar(),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4 - -32.0 - 8.0,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: radius, color: mainColor),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "200DA",
                      style: textStyleTitle,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            ConfigSlider(
                config: Config(
                    icon: Text("test"),
                    points: ["chewiya", "bzf", "khra"],
                    prices: [0, 40, 80],
                    defaut: 0))
          ],
        ),
      ),
    );
  }
}
