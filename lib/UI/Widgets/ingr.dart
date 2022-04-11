import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/UI/Decoration/covers.dart';

class IngSqaure extends StatefulWidget {
  final String image;
  final String name;
  const IngSqaure({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<IngSqaure> createState() => _IngSqaureState();
}

class _IngSqaureState extends State<IngSqaure> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Sqaure(
            child: Image.asset(
          widget.image,
          fit: BoxFit.scaleDown,
          width: 50,
          height: 50,
        )),
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              widget.name,
              style: textStyleSmall,
            ),
          ),
        )
      ],
    );
  }
}
