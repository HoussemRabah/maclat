import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';

class Counter extends StatefulWidget {
  final int limit;
  const Counter({Key? key, required this.limit}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

int counte = 1;

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.0,
      width: 69.0 * 2,
      decoration: BoxDecoration(
          borderRadius: radius, color: inColor, boxShadow: shadows),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (counte != 0) counte--;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: radius,
              ),
              padding: EdgeInsets.all(2.0),
              child: Icon(
                LineIcons.plus,
                color: inColor,
                size: 30,
              ),
            ),
          ),
          Text(
            "${counte}",
            style: textStyleSouTitle,
          ),
          GestureDetector(
            onTap: () {
              if (counte != widget.limit) counte++;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: radius,
              ),
              padding: EdgeInsets.all(2.0),
              child: Icon(
                LineIcons.plus,
                color: inColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
