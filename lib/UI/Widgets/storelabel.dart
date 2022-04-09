import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbh/Core/constants.dart';

class StoreLabel extends StatefulWidget {
  const StoreLabel({Key? key}) : super(key: key);

  @override
  State<StoreLabel> createState() => _StoreLabelState();
}

class _StoreLabelState extends State<StoreLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
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
              style: textStyleSouSimple,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.star,
                  color: Colors.orange,
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
