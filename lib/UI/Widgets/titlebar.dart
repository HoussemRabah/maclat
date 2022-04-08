import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8.0,
        ),
        Text(
          "recommandé",
          style: textStyleSouTitle,
        ),
        Spacer(),
        Text(
          "afficher plus",
          style: textStyleSmall.copyWith(color: mainColor),
        ),
        SizedBox(
          width: 8.0,
        ),
      ],
    );
  }
}
