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

class Ing {
  String image;
  String title;
  Ing({required this.image, required this.title});
}

class Health {
  String title;
  bool stat;
  Health({required this.title, required this.stat});
}

class Food {
  String name;
  Price price;
  String disc;
  String discRapide;
  String image;
  Store store;
  String category;
  List<Config> configs;
  int? qntLimitDown;
  int? qntLimitUp;
  List<Sup>? sups;
  List<Ing> ings;
  List<Health>? healths;

  Configuration getConfigurationModel() => new Configuration(
      configs: configs,
      qnt: qntLimitDown ?? 1,
      qntLimitDown: qntLimitDown,
      qntLimitUp: qntLimitUp);
  Food(
      {required this.name,
      required this.category,
      required this.price,
      required this.disc,
      required this.discRapide,
      required this.image,
      required this.store,
      required this.configs,
      this.sups,
      required this.ings,
      this.qntLimitDown,
      this.qntLimitUp,
      this.healths});
}

class Store {
  String name;
  String rate;
  String image;
  String background;
  String statut;
  String disc;
  Store({
    required this.name,
    required this.rate,
    required this.disc,
    required this.image,
    required this.background,
    required this.statut,
  });
}

class Config {
  Widget icon;
  double value = 0.0;
  List<String> points;
  List<int> prices;
  int defaut;
  int getPrice() {
    return prices[valueToPoint()];
  }

  String getPriceFormatString(int choice) {
    int totalPrice = getPrice();
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

  int getTotalPrice() => (count <= free) ? 0 : price * (count - free);

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

  Price getExtra() {
    int totalPrice = 0;
    for (int i = 0; i < configs.length; i++) {
      totalPrice += configs[i].getPrice();
    }
    return Price(priceNow: totalPrice, priceFormat: PriceFormat.simple);
  }

  String getPriceFormatString(int baseprice) {
    int totalPrice = getPrice(baseprice);
    return Price(priceFormat: PriceFormat.simple, priceNow: totalPrice)
        .getPriceString();
  }

  int getPrice(int baseprice) {
    int totalPrice = baseprice;
    for (int i = 0; i < configs.length; i++) {
      totalPrice += configs[i].getPrice();
    }
    return (totalPrice * qnt);
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

  Configuration(
      {required this.configs,
      required this.qnt,
      this.qntLimitDown,
      this.qntLimitUp}) {
    choices = [for (Config config in configs) config.defaut];
  }
}

class FoodOrdre {
  Food food;
  Configuration configurationModel;
  List<Configuration> configurations = [];

  int getQntTotal() {
    int qnt = 0;
    for (Configuration c in configurations) {
      qnt += c.qnt;
    }

    return qnt;
  }

  Price getSupPrice() {
    int prix = 0;
    for (Sup c in food.sups ?? []) {
      prix += c.getTotalPrice();
    }

    return Price(priceNow: prix, priceFormat: PriceFormat.simple);
  }

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
      priceTotal += c.getPrice(food.price.priceNow);
    }
    for (Sup s in food.sups ?? []) {
      priceTotal += s.getTotalPrice();
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
