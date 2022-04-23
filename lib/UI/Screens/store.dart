import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass/glass.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Core/examples.dart';
import 'package:mbh/UI/Decoration/glasscontainer.dart';
import 'package:mbh/UI/Widgets/cards/foodcard.dart';
import 'package:mbh/UI/Widgets/cards/storecard.dart';
import 'package:mbh/UI/Widgets/ess/appbar.dart';
import 'package:mbh/UI/Widgets/label/ratelabel.dart';
import 'package:mbh/UI/Widgets/react/reaction.dart';

import '../../Logic/Modules/food.dart';

class StoreScreen extends StatefulWidget {
  final Store store;
  const StoreScreen({Key? key, required this.store}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                widget.store.background,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 69.0 + 8.0 + 8.0,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlassContainer(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            widget.store.image,
                            width: 69.0,
                            height: 69.0,
                          ),
                          Text(
                            widget.store.name,
                            style:
                                textStyleSouTitle.copyWith(color: Colors.white),
                          ),
                          RateLabel(rate: widget.store.rate),
                          Text(
                            widget.store.disc,
                            style:
                                textStyleSimple.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                    width: 300,
                    child: Image.asset(
                      widget.store.statut,
                      fit: BoxFit.fitWidth,
                    )),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GlassContainer(
                      child: Row(
                    children: [
                      ReactionButtons(),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                          height: 69.0,
                          decoration: BoxDecoration(
                              borderRadius: radius, color: mainColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.box,
                                color: inColor,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                "72 ventes",
                                style: textStyleSimple.copyWith(color: inColor),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                )
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 64.0,
                  ),
                  Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: backColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "glisser ver la bas pour voir menu",
                            style: textStyleSimple,
                          ),
                        ),
                        SizedBox(
                          height: 69.0,
                        ),
                        GroupedListView<dynamic, String>(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          elements: foodExamples.where((element) {
                            return (element.store == widget.store);
                          }).toList(),
                          groupBy: (element) => (element as Food).category,
                          groupSeparatorBuilder: (String groupByValue) => Text(
                            groupByValue,
                            style: textStyleSouTitle,
                          ),
                          itemBuilder: (context, dynamic element) =>
                              FoodCard(label: false, food: element),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ScreenAppBar()
          ],
        ),
      ),
    );
  }
}
