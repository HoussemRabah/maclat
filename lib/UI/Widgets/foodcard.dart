import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';

import 'storelabel.dart';

class FoodCard extends StatefulWidget {
  final Food food;
  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: inColor, borderRadius: radius),
      child: Column(
        children: [
          StoreLabel(store: widget.food.store),
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
                        widget.food.disc,
                        style: textStyleSouSimple.copyWith(color: greyColor),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      decoration:
                          BoxDecoration(borderRadius: radius, color: mainColor),
                      child: Text(
                        widget.food.price,
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
    );
  }
}
