import 'package:card_swiper/card_swiper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/UI.dart';
import 'package:mbh/UI/Screens/food.dart';

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
          width: MediaQuery.of(context).size.width - 16.0,
          height: 222,
          child: Swiper(
            layout: SwiperLayout.STACK,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Image.asset(
                  'assets/proto/cardads1.png',
                  width: MediaQuery.of(context).size.width - 16.0,
                  fit: BoxFit.fitWidth,
                ),
              );
            },
            itemCount: widget.cards.length,
            itemWidth: MediaQuery.of(context).size.width - 16.0,
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
