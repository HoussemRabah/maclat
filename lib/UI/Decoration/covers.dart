import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';

class Sqaure extends StatefulWidget {
  final Widget child;
  const Sqaure({Key? key, required this.child}) : super(key: key);

  @override
  State<Sqaure> createState() => _SqaureState();
}

class _SqaureState extends State<Sqaure> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
      width: 69,
      height: 69,
      decoration: BoxDecoration(
          borderRadius: radius, color: inColor, boxShadow: shadows),
    );
  }
}

class WhiteBox extends StatefulWidget {
  final Widget child;

  const WhiteBox({Key? key, required this.child}) : super(key: key);

  @override
  State<WhiteBox> createState() => _WhiteBoxState();
}

class _WhiteBoxState extends State<WhiteBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
      decoration: BoxDecoration(
          borderRadius: radius, color: inColor, boxShadow: shadows),
    );
  }
}
