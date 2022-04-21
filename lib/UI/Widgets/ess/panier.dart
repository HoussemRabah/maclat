import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbh/Core/constants.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: inColor,
      badgeContent: Text(
        "2",
        style: textStyleSimple.copyWith(color: mainColor),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          color: mainColor,
        ),
        width: 69,
        height: 69,
        child: Icon(
          FontAwesomeIcons.cartShopping,
          size: 30.0,
          color: inColor,
        ),
      ),
    );
  }
}
