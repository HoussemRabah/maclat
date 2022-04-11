import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/UI/Decoration/covers.dart';

import 'panier.dart';

class ScreenAppBar extends StatefulWidget {
  const ScreenAppBar({Key? key}) : super(key: key);

  @override
  State<ScreenAppBar> createState() => _ScreenAppBarState();
}

class _ScreenAppBarState extends State<ScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Sqaure(
                child: Icon(
              LineIcons.stepBackward,
              size: 30.0,
            )),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
