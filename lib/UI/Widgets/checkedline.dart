import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';

class CheckLine extends StatefulWidget {
  final String text;
  const CheckLine({Key? key, required this.text}) : super(key: key);

  @override
  State<CheckLine> createState() => _CheckLineState();
}

class _CheckLineState extends State<CheckLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          LineIcons.check,
          color: Colors.green,
        ),
        SizedBox(
          width: 2.0,
        ),
        Text(
          widget.text,
          style: textStyleSimple.copyWith(color: Colors.green),
        )
      ],
    );
  }
}
