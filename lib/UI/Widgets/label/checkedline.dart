import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';

import '../../../Logic/Modules/food.dart';

class CheckLine extends StatefulWidget {
  final Health health;
  const CheckLine({Key? key, required this.health}) : super(key: key);

  @override
  State<CheckLine> createState() => _CheckLineState();
}

class _CheckLineState extends State<CheckLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          (widget.health.stat) ? LineIcons.check : LineIcons.exclamation,
          color: (widget.health.stat) ? Colors.green : Colors.red,
          size: 25.0,
        ),
        SizedBox(
          width: 2.0,
        ),
        Text(
          widget.health.title,
          style: textStyleSouSimple.copyWith(color: Colors.green),
        )
      ],
    );
  }
}
