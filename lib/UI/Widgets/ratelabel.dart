import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbh/Core/constants.dart';

class RateLabel extends StatefulWidget {
  final String rate;
  const RateLabel({Key? key, required this.rate}) : super(key: key);

  @override
  State<RateLabel> createState() => _RateLabelState();
}

class _RateLabelState extends State<RateLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
          widget.rate,
          style: textStyleSmall.copyWith(color: Colors.orange),
        ),
      ],
    );
  }
}
