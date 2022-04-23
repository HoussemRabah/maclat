import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/Logic/bloc/foodConfig/food_bloc.dart';
import 'package:mbh/UI/Widgets/counter/counter.dart';
import 'package:mbh/UI/Widgets/ess/appbar.dart';
import 'package:mbh/UI/Widgets/config/config.dart';
import 'package:mbh/UI/Widgets/config/configSup.dart';

import 'login.dart';

class FoodConfigScreen extends StatefulWidget {
  final Food food;
  const FoodConfigScreen({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodConfigScreen> createState() => _FoodConfigScreenState();
}

late FoodBloc foodBloc;

class _FoodConfigScreenState extends State<FoodConfigScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodBloc = new FoodBloc(
        foodOrdre: FoodOrdre(
            food: widget.food,
            configurationModel: widget.food.getConfigurationModel()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (context) => foodBloc,
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
                            widget.food.image,
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
                        // configurations
                        BlocBuilder<FoodBloc, FoodState>(
                            builder: (context, state) {
                          return BuildConfigsList();
                        }),
                        SizedBox(
                          height: 16.0,
                        ),
                        // sups
                        if ((foodBloc.foodOrdre.food.sups ?? []).isNotEmpty)
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
                        BlocBuilder<FoodBloc, FoodState>(
                          builder: (context, state) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  (foodBloc.foodOrdre.food.sups ?? []).length,
                              itemBuilder: (context, index) => ConfigSup(
                                sup: foodBloc.foodOrdre.food.sups![index],
                              ),
                            );
                          },
                        ),

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
                                    BlocBuilder<FoodBloc, FoodState>(
                                      builder: (context, state) {
                                        return Column(
                                          children: [
                                            infoLineBuilder(
                                                "prix de base",
                                                foodBloc.foodOrdre.food.price
                                                    .getPriceString()),
                                            SizedBox(
                                              height: 16.0,
                                            ),
                                            if (foodBloc
                                                .foodOrdre
                                                .configurationModel
                                                .configs
                                                .isNotEmpty)
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: foodBloc.foodOrdre
                                                    .configurations.length,
                                                itemBuilder: (context, index) =>
                                                    Column(
                                                  children: [
                                                    Text(
                                                      (foodBloc
                                                                  .foodOrdre
                                                                  .configurations
                                                                  .length >
                                                              1)
                                                          ? "configuration ${index + 1}"
                                                          : "configuration",
                                                      style: textStyleSimple
                                                          .copyWith(
                                                              color: inColor),
                                                    ),
                                                    if ((foodBloc.foodOrdre.food
                                                                .sups ??
                                                            [])
                                                        .isNotEmpty)
                                                      infoLineBuilder(
                                                          "cout supplémentaire",
                                                          foodBloc
                                                              .foodOrdre
                                                              .configurations[
                                                                  index]
                                                              .getExtra()
                                                              .getPriceString()),
                                                    infoLineBuilder("quantité",
                                                        "X${foodBloc.foodOrdre.configurations[index].qnt}"),
                                                    infoLineBuilder(
                                                        "cout total",
                                                        foodBloc
                                                            .foodOrdre
                                                            .configurations[
                                                                index]
                                                            .getPriceFormatString(
                                                                foodBloc
                                                                    .foodOrdre
                                                                    .food
                                                                    .price
                                                                    .priceNow)),
                                                    SizedBox(
                                                      height: 16.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            SizedBox(
                                              height: 16.0,
                                            ),
                                            infoLineBuilder("quantité total",
                                                "X${foodBloc.foodOrdre.getQntTotal()}"),
                                            if ((foodBloc.foodOrdre.food.sups ??
                                                    [])
                                                .isNotEmpty)
                                              infoLineBuilder(
                                                  "prix des suppléments",
                                                  "${foodBloc.foodOrdre.getSupPrice().getPriceString()}"),
                                            infoLineBuilder("prix total",
                                                "${foodBloc.foodOrdre.getPriceTotalFormatString()}"),
                                            SizedBox(
                                              height: 32.0,
                                            ),
                                          ],
                                        );
                                      },
                                    )
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
                    ),
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
                BlocBuilder<FoodBloc, FoodState>(
                  builder: (context, state) {
                    return Text(
                      "${foodBloc.foodOrdre.getPriceTotalFormatString()}",
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

class BuildConfigsList extends StatelessWidget {
  const BuildConfigsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: foodBloc.foodOrdre.configurations.length,
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(8.0),
                  decoration:
                      BoxDecoration(color: inColor, borderRadius: radius),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            (foodBloc.foodOrdre.configurations.length == 1)
                                ? (foodBloc.foodOrdre.configurationModel.configs
                                        .isNotEmpty)
                                    ? "Configuration"
                                    : "Quantité"
                                : "Configuration ${index + 1}",
                            style: textStyleSimple,
                          ),
                          Spacer(),
                          if (foodBloc.foodOrdre.configurations.length != 1)
                            GestureDetector(
                              onTap: () {
                                foodBloc.add(
                                    FoodEventRemoveConfiguration(index: index));
                              },
                              child: Icon(
                                LineIcons.minus,
                                color: mainColor,
                              ),
                            )
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: foodBloc
                          .foodOrdre.configurations[index].configs.length,
                      itemBuilder: (context, configIndex) => Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
                        child: ConfigSlider(
                            config: foodBloc.foodOrdre.configurations[index]
                                .configs[configIndex]),
                      ),
                    ),
                    Counter(
                        configuration:
                            foodBloc.foodOrdre.configurations[index]),
                    SizedBox(
                      height: 16.0,
                    ),
                  ]),
                )),
        if (foodBloc.foodOrdre.configurationModel.configs.isNotEmpty)
          GestureDetector(
            onTap: () {
              foodBloc.add(FoodEventAddConfiguration());
            },
            child: Text(
              "ajouter d'autre configuration",
              style: textStyleSimple.copyWith(color: mainColor),
            ),
          ),
      ],
    );
  }
}
