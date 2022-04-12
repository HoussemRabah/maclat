import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Decoration/covers.dart';

class ConfigSup extends StatefulWidget {
  final Sup sup;
  const ConfigSup({Key? key, required this.sup}) : super(key: key);

  @override
  State<ConfigSup> createState() => _ConfigSupState();
}

class _ConfigSupState extends State<ConfigSup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: radius, color: inColor, boxShadow: shadows),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Sqaure(
                      child: Image.asset(
                    widget.sup.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.scaleDown,
                  )),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            69 -
                            8.0 * 2 * 2 -
                            8.0 -
                            69 -
                            8.0 -
                            8.0 * 2 * 2 -
                            8.0 * 2,
                        child: Text(
                          widget.sup.name,
                          style: textStyleSouSimple,
                        ),
                      ),
                      (widget.sup.free > 0)
                          ? Text(
                              "${widget.sup.price} DA (${widget.sup.free} gratuits)",
                              style:
                                  textStyleSouSimple.copyWith(color: mainColor),
                            )
                          : Text(
                              "${widget.sup.price} DA",
                              style:
                                  textStyleSouSimple.copyWith(color: mainColor),
                            ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Badge(
            badgeColor: mainColor,
            shape: BadgeShape.square,
            showBadge: (widget.sup.count != 0),
            badgeContent: Text(
              "X${widget.sup.count} +${widget.sup.count * widget.sup.price}DA",
              style: textStyleSmall.copyWith(color: inColor),
            ),
            child: Container(
              width: 69 + 8.0 * 2,
              alignment: (widget.sup.count != 0)
                  ? Alignment.bottomCenter
                  : Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: radius, color: inColor, boxShadow: shadows),
              padding: EdgeInsets.all(4.0),
              height: 69 + 8.0 * 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.sup.count != 0)
                    GestureDetector(
                      onTap: () {
                        if (widget.sup.count != 0) {
                          widget.sup.count--;
                          setState(() {});
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: radius,
                        ),
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          LineIcons.minus,
                          color: inColor,
                          size: 30,
                        ),
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      if (widget.sup.count != widget.sup.limit) {
                        widget.sup.count++;
                        setState(() {});
                      }
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
            ),
          )
        ],
      ),
    );
  }
}
