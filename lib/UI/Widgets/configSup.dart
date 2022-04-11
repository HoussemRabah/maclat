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
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: radius, color: inColor, boxShadow: shadows),
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
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
                children: [
                  Text(
                    widget.sup.name,
                    style: textStyleSimple,
                  ),
                  (widget.sup.free > 0)
                      ? Text(
                          "${widget.sup.price} DA (${widget.sup.free} gratuits)",
                          style: textStyleSimple.copyWith(color: mainColor),
                        )
                      : Text(
                          "${widget.sup.price} DA",
                          style: textStyleSimple.copyWith(color: mainColor),
                        ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: radius, color: inColor, boxShadow: shadows),
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      LineIcons.minus,
                      color: inColor,
                    ),
                  ),
                ),
              if (widget.sup.count == 0)
                Text(
                  "Ajouter",
                  style: textStyleSimple.copyWith(color: mainColor),
                ),
              if (widget.sup.count != 0)
                Text(
                  "{widget.sup.count}",
                  style: textStyleSimple.copyWith(color: mainColor),
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
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    LineIcons.plus,
                    color: inColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
