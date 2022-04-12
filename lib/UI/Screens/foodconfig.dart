import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/Logic/bloc%20food/food_bloc.dart';
import 'package:mbh/UI/Widgets/appbar.dart';
import 'package:mbh/UI/Widgets/config.dart';
import 'package:mbh/UI/Widgets/configSup.dart';
import 'package:mbh/UI/Widgets/counter.dart';
import 'package:mbh/UI/Widgets/panier.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'login.dart';

class FoodConfigScreen extends StatefulWidget {
  const FoodConfigScreen({Key? key}) : super(key: key);

  @override
  State<FoodConfigScreen> createState() => _FoodConfigScreenState();
}

class _FoodConfigScreenState extends State<FoodConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => foodBloc,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backColor,
          bottomNavigationBar: Container(
            child: appBarBuilder(),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: inColor,
                boxShadow: navigationBarShadows),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
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
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 64.0,
                        ),
                        ConfigSlider(
                            config: Config(
                                icon: Text(
                                  "taille",
                                  style: textStyleSimple.copyWith(
                                      color: mainColor),
                                ),
                                points: ["S", "M", "X", "XL", "XLL"],
                                prices: [0, 100, 150, 170, 250],
                                defaut: 1)),
                        ConfigSlider(
                            config: Config(
                                icon: Image.asset(
                                  "assets/ing/pic.png",
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                                points: ["non", "un peu", "tres"],
                                prices: [
                                  0,
                                  0,
                                  10,
                                ],
                                defaut: 1)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Suppléments",
                                style: textStyleSimple,
                              ),
                            ],
                          ),
                        ),
                        ConfigSup(
                            sup: Sup(
                                image: "assets/ing/coca.png",
                                name: "cocacola 0.25L",
                                price: 60,
                                limit: 6,
                                count: 0,
                                free: 0)),
                        ConfigSup(
                            sup: Sup(
                                image: "assets/ing/khbz.png",
                                name: "pains",
                                price: 10,
                                limit: 4,
                                count: 1,
                                free: 2)),
                        Container(
                          margin: EdgeInsets.all(16.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: radius, color: inColor),
                          child: TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintMaxLines: 3,
                                hintText:
                                    "Commentaire au chef pour lui donner une consigne"),
                          ),
                        ),
                        SizedBox(
                          height: 69.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ScreenAppBar(),
            ],
          ),
        ),
      ),
    );
  }

  Row appBarBuilder() {
    return Row(
      children: [
        Counter(limit: 50),
        SizedBox(width: 8.0),
        Expanded(
          child: Container(
            height: 69.0,
            decoration: BoxDecoration(
              borderRadius: radius,
              color: mainColor,
            ),
            padding: EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<FoodBloc, FoodState>(
                  builder: (context, state) {
                    return Text(
                      "${foodBloc.prixtotal}DA",
                      style: textStyleSouTitle.copyWith(color: inColor),
                    );
                  },
                ),
                Text(
                  "Ajouter au panier",
                  style: textStyleSouSimple.copyWith(color: inColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
