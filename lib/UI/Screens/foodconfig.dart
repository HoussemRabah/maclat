import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/Logic/blocfood/food_bloc.dart';
import 'package:mbh/UI/Widgets/appbar.dart';
import 'package:mbh/UI/Widgets/config.dart';
import 'package:mbh/UI/Widgets/configSup.dart';
import 'package:mbh/UI/Widgets/counter.dart';

import 'login.dart';

class FoodConfigScreen extends StatefulWidget {
  const FoodConfigScreen({Key? key}) : super(key: key);

  @override
  State<FoodConfigScreen> createState() => _FoodConfigScreenState();
}

class _FoodConfigScreenState extends State<FoodConfigScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodBloc = new FoodBloc(prixtotal: 200);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (context) => foodBloc..add(FoodEEventRefresh()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backColor,
          bottomNavigationBar: Container(
            child: BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                return appBarBuilder();
              },
            ),
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
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Quantité",
                                style: textStyleSimple,
                              ),
                            ],
                          ),
                        ),
                        QntSlider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Options",
                                style: textStyleSimple,
                              ),
                            ],
                          ),
                        ),
                        ConfigSlider(
                            index: 0,
                            config: Config(
                                icon: Text(
                                  "taille",
                                  style: textStyleSimple.copyWith(
                                      color: mainColor),
                                ),
                                points: ["S", "M", "X", "XL", "XLL"],
                                prices: [0, 100, 150, 170, 250],
                                defaut: 0)),
                        ConfigSlider(
                            index: 1,
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
                            index: 2,
                            sup: Sup(
                                image: "assets/ing/coca.png",
                                name: "cocacola 0.25L",
                                price: 60,
                                limit: 6,
                                count: 0,
                                free: 0)),
                        ConfigSup(
                            index: 3,
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
                        ClipPath(
                          clipper: MovieTicketClipper(),
                          child: Container(
                            color: mainColor,
                            margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                            padding: EdgeInsets.all(16.0),
                            child: BlocBuilder<FoodBloc, FoodState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    infoLineBuilder("prix de base", "200DA"),
                                    infoLineBuilder(
                                        "quantité", "${foodBloc.qnt}"),
                                    SizedBox(height: 8.0,),
                                    
                                    if (foodBloc.sups[0] != 0)
                                      infoLineBuilder("cout de taille",
                                          "${foodBloc.sups[0]}DA"),
                                    if (foodBloc.sups[1] != 0)
                                      infoLineBuilder("cout de piment",
                                          "${foodBloc.sups[1]}DA"),
                                    if (foodBloc.sups[2] != 0)
                                      infoLineBuilder("prix de cocacola 0.25L",
                                          "${foodBloc.sups[2]}DA"),
                                    if (foodBloc.sups[3] != 0)
                                      infoLineBuilder("prix de pains",
                                          "${foodBloc.sups[3]}DA"),
                                    
                                    SizedBox(height: 8.0,),
                                    infoLineBuilder("prix total",
                                        "${foodBloc.prixtotal}DA"),
                                  ],
                                );
                              },
                            ),
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

  Row infoLineBuilder(String info, String data) {
    return Row(
      children: [
        Text(
          info,
          style: textStyleSimple.copyWith(color: inColor),
        ),
        Spacer(),
        Text(
          data,
          style: textStyleSimple.copyWith(color: inColor),
        ),
      ],
    );
  }

  Row appBarBuilder() {
    return Row(
      children: [
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
                Text(
                  "${foodBloc.prixtotal}DA",
                  style: textStyleSouTitle.copyWith(color: inColor),
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
