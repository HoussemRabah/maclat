import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Screens/food.dart';

import '../label/storelabel.dart';

class FoodCard extends StatefulWidget {
  final Food food;
  final bool? label;
  const FoodCard({Key? key, required this.food, this.label}) : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => FoodScreen(
                    food: widget.food,
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: inColor, borderRadius: radius),
        child: Column(
          children: [
            if (widget.label != null)
              if (widget.label!) StoreLabel(store: widget.food.store),
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.5 - 16.0,
                    width: MediaQuery.of(context).size.width * 0.5 - 16.0,
                    decoration: BoxDecoration(borderRadius: radius),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      widget.food.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * 0.5 -
                            16.0 -
                            8.0 -
                            8.0 -
                            8.0 -
                            8.0 -
                            8.0,
                        child: Text(
                          widget.food.name,
                          style: textStyleSouTitle,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * 0.5 -
                            16.0 -
                            8.0 -
                            8.0 -
                            8.0 -
                            8.0 -
                            8.0,
                        child: Text(
                          widget.food.discRapide,
                          style: textStyleSouSimple.copyWith(color: greyColor),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            LineIcons.clock,
                            size: 18.0,
                          ),
                          Text(
                            "1h",
                            style: textStyleSouSimple,
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            borderRadius: radius, color: mainColor),
                        child: Text(
                          widget.food.price.getPriceString(),
                          style: textStyleSimple.copyWith(color: inColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
