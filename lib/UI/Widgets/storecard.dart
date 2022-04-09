import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/UI/Widgets/ratelabel.dart';

class StoreCard extends StatefulWidget {
  const StoreCard({Key? key}) : super(key: key);

  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: radius, color: inColor),
      child: Row(
        children: [
          Container(
            width: 60.0,
            decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/proto/store.svf",
                  fit: BoxFit.fitWidth,
                  width: 40.0,
                ),
                Text(
                  "Fares Food",
                  style: textStyleSimple,
                ),
                RateLabel(rate: "3.5"),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(360))),
                        child: Image.asset(
                          examples[i],
                          fit: BoxFit.cover,
                        ))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width -
                    60.0 -
                    8.0 -
                    8.0 -
                    8.0 -
                    8.0,
                child: Text(
                  "Je suis Fares un chef professionnel, avec 8 ans d'expérience je vous accueille dans mon restaurant propre",
                  style: textStyleSouSimple.copyWith(color: greyColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
