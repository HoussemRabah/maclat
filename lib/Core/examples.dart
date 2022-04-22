import 'package:flutter/material.dart';
import 'package:mbh/Logic/Modules/food.dart';

import 'constants.dart';

List<Food> foodExamples = [
  Food(
      name: "Tajin el ziton",
      price: Price(priceNow: 200, priceFormat: PriceFormat.simple),
      disc: "olives, viande et poulet",
      discRapide: "olives, viande et poulet",
      image: "assets/proto/exp3.png",
      store: storesExamples[0],
      qntLimitDown: 1,
      qntLimitUp: 10,
      sups: [
        Sup(
            image: "assets/ing/coca.png",
            name: "cocacola 0.25L",
            price: 60,
            limit: 6,
            count: 0,
            free: 0),
        Sup(
            image: "assets/ing/khbz.png",
            name: "pains",
            price: 10,
            limit: 4,
            count: 1,
            free: 2)
      ],
      configs: [
        Config(
          icon: Text(
            "taille",
            style: textStyleSimple.copyWith(color: mainColor),
          ),
          points: ["S", "M", "X", "XL"],
          prices: [0, 100, 150, 200],
          defaut: 0,
        ),
        Config(
            icon: Image.asset(
              "assets/ing/pic.png",
              width: 30,
              fit: BoxFit.cover,
            ),
            points: ["non", "un peu", "tres"],
            prices: [
              0,
              0,
              10,
            ],
            defaut: 1),
      ],
      ings: [
        Ing(title: "frites", image: "assets/ing/frite.png"),
        Ing(title: "pomme de terre", image: "assets/ing/potato.png"),
        Ing(title: "riz", image: "assets/ing/rice.png"),
        Ing(title: "Viande", image: "assets/ing/steak.png"),
      ],
      healths: [
        Health(title: "pour le diabète", stat: true),
        Health(title: "pour votre regime", stat: true),
      ]),
  Food(
      name: "Baklawa",
      price: Price(priceNow: 70, priceFormat: PriceFormat.unit, unit: 1),
      disc: "Délicieux baklawa d'un professionnel",
      discRapide: "Délicieux baklawa d'un professionnel",
      image: "assets/proto/exp4.png",
      store: storesExamples[1],
      qntLimitUp: 15,
      qntLimitDown: 2,
      configs: [],
      ings: [
        Ing(title: "frites", image: "assets/ing/frite.png"),
        Ing(title: "pomme de terre", image: "assets/ing/potato.png"),
        Ing(title: "riz", image: "assets/ing/rice.png"),
        Ing(title: "Viande", image: "assets/ing/steak.png"),
      ],
      healths: [
        Health(title: "pour le diabète", stat: true),
        Health(title: "pour votre regime", stat: true),
      ])
];

List<Store> storesExamples = [
  Store(
      name: "HomeFood Resto",
      rate: "3.4",
      disc:
          "Je suis Fares un chef professionnel, avec 8 ans d'expérience je vous accueille dans mon restaurant propre",
      image: "assets/proto/store.svg"),
  Store(
      name: "om Ramy Sweet",
      rate: "4.2",
      disc:
          "Je suis Fares un chef professionnel, avec 8 ans d'expérience je vous accueille dans mon restaurant propre",
      image: "assets/proto/store.svg")
];
