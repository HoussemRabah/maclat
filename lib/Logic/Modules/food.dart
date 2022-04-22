import 'package:flutter/material.dart';

enum PriceFormat { simple, promo, unit }

class Price {
  int priceNow;
  int? priceOld;
  int? unit;
  PriceFormat priceFormat;
  getPriceString() {
    switch (priceFormat) {
      case PriceFormat.simple:
        return "${priceNow}DA";

      case PriceFormat.unit:
        return "${priceNow}DA for ${unit ?? 1}";

      case PriceFormat.promo:
        return "${priceNow}DA";
    }
  }

  Price(
      {required this.priceNow,
      required this.priceFormat,
      this.priceOld,
      this.unit});
}

class Food {
  String name;
  Price price;
  String disc;
  String image;
  Store store;
  List<Config> configs;
  List<Sup>? sups;

  Configuration getConfigurationModel() =>
      new Configuration(configs: configs, qnt: 1);
  Food(
      {required this.name,
      required this.price,
      required this.disc,
      required this.image,
      required this.store,
      required this.configs,
      this.sups});
}

class Store {
  String name;
  String rate;
  Store({required this.name, required this.rate});
}

class Config {
  Widget icon;
  double value = 0.0;
  List<String> points;
  List<int> prices;
  int defaut;
  int getPrice(int choice) {
    return prices[choice];
  }

  String getPriceFormatString(int choice) {
    int totalPrice = getPrice(choice);
    return Price(priceFormat: PriceFormat.simple, priceNow: totalPrice)
        .getPriceString();
  }

  int valueToPoint() {
    return (value * (points.length - 1)).ceil();
  }

  double pointToValue(int point) {
    return point / (points.length - 1);
  }

  Config({
    required this.icon,
    required this.points,
    required this.prices,
    required this.defaut,
  }) {
    value = pointToValue(defaut);
  }
}

class Sup {
  String image;
  String name;
  int price;
  int limit;
  int? limitDown;
  int free;
  int count;

  int getTotalPrice() => price * (count - free);

  Sup(
      {required this.image,
      required this.name,
      required this.price,
      required this.limit,
      required this.free,
      required this.count,
      this.limitDown}) {
    if (limitDown == null) limitDown = 0;
  }
}

class Configuration {
  List<Config> configs;
  int qnt;
  int? qntLimitDown;
  int? qntLimitUp;
  List<int> choices = [];

  String getPriceFormatString() {
    int totalPrice = getPrice();
    return Price(priceFormat: PriceFormat.simple, priceNow: totalPrice)
        .getPriceString();
  }

  int getPrice() {
    int totalPrice = 0;
    for (int i = 0; i < configs.length; i++) {
      totalPrice += configs[i].getPrice(choices[i]);
    }
    return totalPrice;
  }

  int castQnt() => qnt + 0;

  List<Config> castConfigs() => [
        for (Config c in configs)
          new Config(
            icon: c.icon,
            points: c.points,
            prices: c.prices,
            defaut: c.defaut,
          )
      ];

  Configuration({required this.configs, required this.qnt}) {
    choices = [for (Config config in configs) config.defaut];
  }
}

class FoodOrdre {
  Food food;
  Configuration configurationModel;
  List<Configuration> configurations = [];

  addConfiguration() {
    configurations.add(new Configuration(
        configs: configurationModel.castConfigs(),
        qnt: configurationModel.castQnt()));
  }

  removeConfiguration(int index) {
    if (configurations.length > 1) configurations.removeAt(index);
  }

  updateConfiguration(
      {required Configuration configuration, required int index}) {
    configurations[index] = configuration;
  }

  int getPriceTotal() {
    int priceTotal = 0;
    for (Configuration c in configurations) {
      priceTotal += c.getPrice();
    }
    return priceTotal;
  }

  String getPriceTotalFormatString() {
    int totalPrice = getPriceTotal();
    return Price(priceFormat: PriceFormat.simple, priceNow: totalPrice)
        .getPriceString();
  }

  FoodOrdre({required this.food, required this.configurationModel}) {
    addConfiguration();
  }
}
