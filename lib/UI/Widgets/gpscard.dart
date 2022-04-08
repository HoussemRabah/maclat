import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';

class GpsCard extends StatefulWidget {
  const GpsCard({Key? key}) : super(key: key);

  @override
  State<GpsCard> createState() => _GpsCardState();
}

class _GpsCardState extends State<GpsCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(8.0),
          height: 124,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: radius,
          ),
          child: Image.asset(
            "assets/proto/maps.png",
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'Rouiba,Alger',
          style: textStyleSouTitle,
        ),
        Positioned(
          top: 95,
          child: ClipPath(
            clipper: OvalTopBorderClipper(),
            child: Container(
                width: 100.0,
                height: 40.0,
                color: backColor,
                child: Icon(
                  LineIcons.mapMarker,
                  color: mainColor,
                  size: 30.0,
                )),
          ),
        )
      ],
    );
  }
}
