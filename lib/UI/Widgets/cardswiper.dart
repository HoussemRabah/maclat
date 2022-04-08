import 'package:card_swiper/card_swiper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/UI.dart';

int _index = 0;

class CardSwiper extends StatefulWidget {
  final List<CardSwip> cards;
  const CardSwiper({Key? key, required this.cards}) : super(key: key);

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 222,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.asset(
                'assets/proto/cardads1.png',
                fit: BoxFit.fitWidth,
                width: 300,
              );
            },
            itemCount: widget.cards.length,
            index: _index,
            onIndexChanged: (index) {
              _index = index;
              setState(() {});
            },
          ),
        ),
        DotsIndicator(
          dotsCount: widget.cards.length,
          position: double.parse(_index.toString()),
          decorator: DotsDecorator(
            color: greyColor,
            activeColor: mainColor,
          ),
        )
      ],
    );
  }
}
