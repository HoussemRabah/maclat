import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';

class Counter extends StatefulWidget {
  final int counte;
  final int limit;
  const Counter({Key? key, required this.counte, required this.limit})
      : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: radius, color: inColor, boxShadow: shadows),
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [],
      ),
    );
  }
}
