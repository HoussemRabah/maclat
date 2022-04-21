import 'package:badges/badges.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/UI/Screens/food.dart';

class FoodTinder extends StatefulWidget {
  const FoodTinder({Key? key}) : super(key: key);

  @override
  State<FoodTinder> createState() => _FoodTinderState();
}

class _FoodTinderState extends State<FoodTinder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width - 16.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //        Navigator.of(context)
              //          .push(MaterialPageRoute(builder: (context) => FoodScreen()));
            },
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Badge(
                animationType: BadgeAnimationType.slide,
                animationDuration: Duration(seconds: 1),
                shape: BadgeShape.square,
                borderRadius: radius,
                badgeColor: mainColor,
                badgeContent: Text(
                  "200DA",
                  style: textStyleSimple.copyWith(color: inColor),
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: MediaQuery.of(context).size.width - 16.0,
                  height: MediaQuery.of(context).size.width - 16.0,
                  decoration: BoxDecoration(borderRadius: radius),
                  child: Image.asset(
                    examples[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration:
                      BoxDecoration(borderRadius: radius, color: mainColor),
                  child: Text(
                    examplesNames[index],
                    style: textStyleSimple.copyWith(color: inColor),
                  ),
                ),
              ),
            ]),
          );
        },
        itemWidth: MediaQuery.of(context).size.width - 16.0,
        itemHeight: MediaQuery.of(context).size.width - 16.0,
        itemCount: 4,
        viewportFraction: 0.7,
        layout: SwiperLayout.TINDER,
        pagination: null,
      ),
    );
  }
}
