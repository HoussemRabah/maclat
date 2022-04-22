import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glass/glass.dart';

import '../../Core/constants.dart';

class GlassContainer extends StatefulWidget {
  final Widget child;
  const GlassContainer({Key? key, required this.child}) : super(key: key);

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(borderRadius: radius),
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            child: widget.child)
        .asGlass(
            blurX: 5,
            blurY: 5,
            clipBorderRadius: radius,
            tintColor: frontColor,
            tileMode: TileMode.mirror);
  }
}
