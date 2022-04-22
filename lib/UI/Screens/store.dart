import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass/glass.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/UI/Widgets/ess/appbar.dart';
import 'package:mbh/UI/Widgets/label/ratelabel.dart';

import '../../Logic/Modules/food.dart';

class StoreScreen extends StatefulWidget {
  final Store store;
  const StoreScreen({Key? key, required this.store}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/proto/exp4.png",
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: radius),
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(widget.store.image),
                            Text(
                              widget.store.name,
                              style: textStyleSouTitle,
                            ),
                            RateLabel(rate: widget.store.rate),
                            Text(
                              widget.store.disc,
                            ),
                          ],
                        ),
                      ).asGlass()
                    ],
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 32.0,
                  ),
                  Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: inColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Text("wow"),
                  ),
                ],
              ),
            ),
            ScreenAppBar()
          ],
        ),
      ),
    );
  }
}
