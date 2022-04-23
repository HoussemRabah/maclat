import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Core/examples.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Screens/store.dart';
import 'package:mbh/UI/Widgets/label/ratelabel.dart';

class StoreCard extends StatefulWidget {
  final Store store;
  const StoreCard({Key? key, required this.store}) : super(key: key);

  @override
  State<StoreCard> createState() => _StoreCardState();
}

late List<Food> threeFood;

class _StoreCardState extends State<StoreCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    threeFood = foodExamples
        .where((element) => (element.store == widget.store))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StoreScreen(
                  store: widget.store,
                )));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: radius, color: inColor, boxShadow: shadows),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 200.0,
              decoration: BoxDecoration(
                  color: greyColor.withAlpha(100),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    widget.store.image,
                    fit: BoxFit.fitWidth,
                    width: 40.0,
                  ),
                  Text(
                    widget.store.name,
                    style: textStyleSimple,
                    textAlign: TextAlign.center,
                  ),
                  RateLabel(rate: widget.store.rate),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    for (int i = 0; i < 3 && i < threeFood.length; i++)
                      Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(top: 8.0, right: 4.0),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            threeFood[i].image,
                            fit: BoxFit.cover,
                          ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width -
                        120.0 -
                        16.0 -
                        8.0 -
                        8.0 -
                        8.0 -
                        8.0,
                    height: 200 - 8.0 - 8.0 - 8.0 - 8.0 - 60,
                    child: Text(
                      widget.store.disc,
                      style: textStyleSmall.copyWith(color: greyColor),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
