import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';

class StoreLabel extends StatefulWidget {
  final Store store;
  const StoreLabel({Key? key, required this.store}) : super(key: key);

  @override
  State<StoreLabel> createState() => _StoreLabelState();
}

class _StoreLabelState extends State<StoreLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/proto/store.svg",
          width: 50.0,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          width: 4.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "FaresFood",
              style: textStyleSimple,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.star,
                  color: Colors.orange,
                  size: 15.0,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "3.5",
                  style: textStyleSmall.copyWith(color: Colors.orange),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
