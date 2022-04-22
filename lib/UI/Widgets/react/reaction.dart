import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../Core/constants.dart';
import '../../Decoration/covers.dart';

class ReactionButtons extends StatefulWidget {
  const ReactionButtons({Key? key}) : super(key: key);

  @override
  State<ReactionButtons> createState() => _ReactionButtonsState();
}

class _ReactionButtonsState extends State<ReactionButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Badge(
          badgeColor: mainColor,
          badgeContent: Text(
            "17",
            style: textStyleSouSimple.copyWith(color: inColor),
          ),
          child: Sqaure(
              child: Icon(
            LineIcons.heart,
            color: greyColor,
            size: 30.0,
          )),
        ),
        SizedBox(
          width: 8.0,
        ),
        Badge(
          badgeColor: mainColor,
          badgeContent: Text(
            "20",
            style: textStyleSouSimple.copyWith(color: inColor),
          ),
          child: Sqaure(
              child: Icon(
            LineIcons.comment,
            color: greyColor,
            size: 30.0,
          )),
        ),
      ],
    );
  }
}
