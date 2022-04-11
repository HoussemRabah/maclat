import 'package:flutter/cupertino.dart';

class Food {
  String name;
  String price;
  String disc;
  String image;
  Store store;
  Food(
      {required this.name,
      required this.price,
      required this.disc,
      required this.image,
      required this.store});
}

class Store {
  String name;
  String rate;
  Store({required this.name, required this.rate});
}

class Config {
  Widget icon;
  List<String> points;
  List<int> prices;
  int defaut;
  Config(
      {required this.icon,
      required this.points,
      required this.prices,
      required this.defaut});
}

class Sup {
  String image;
  String name;
  int price;
  int limit;
  int free;
  int count;
  Sup(
      {required this.image,
      required this.name,
      required this.price,
      required this.limit,
      required this.free,
      required this.count});
}
