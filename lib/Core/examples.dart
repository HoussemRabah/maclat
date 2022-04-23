import 'package:flutter/material.dart';
import 'package:mbh/Logic/Modules/food.dart';

import 'constants.dart';

List<Food> foodExamples = [
  Food(
      name: "plat varié express",
      category: "plat varié",
      price: Price(priceNow: 170, priceFormat: PriceFormat.simple),
      disc:
          "Un plat soigneusement étudié qui contient tout ce qu'une personne devrait manger dans une journée à travers un mélange de riz cuit à la vapeur, de viande, de pommes de terre bouillies et frites, et d'une quantité de légumes tels que des carottes.",
      discRapide:
          "Un plat léger qui contient les éléments nécessaires pour compléter votre journée",
      image: "assets/proto/exp1.png",
      store: storesExamples[0],
      qntLimitDown: 1,
      qntLimitUp: 15,
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
          prices: [0, 50, 100, 150],
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
        Ing(title: "carrot", image: "assets/ing/carrot.png"),
      ],
      healths: [
        Health(title: "pour le diabète", stat: true),
        Health(title: "pour une femme enceinte", stat: true),
        Health(title: "pour votre regime", stat: true),
      ]),
  Food(
      name: "super plat",
      category: "plat varié",
      price: Price(priceNow: 250, priceFormat: PriceFormat.simple),
      disc:
          "Steaks frais de notre boucherie, blanc de poulet savamment cuit avec les épices nécessaires et un lot de frites, riz et salade",
      discRapide:
          "Un plat qui contient du steak et du poulet et garantit que vous êtes satisfait",
      image: "assets/proto/exp2.png",
      store: storesExamples[0],
      qntLimitDown: 1,
      qntLimitUp: 15,
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
            free: 3)
      ],
      configs: [
        Config(
          icon: Text(
            "taille",
            style: textStyleSimple.copyWith(color: mainColor),
          ),
          points: ["S", "M", "X"],
          prices: [0, 100, 200],
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
        Config(
            icon: Image.asset(
              "assets/ing/frite.png",
              width: 30,
              height: 30,
              fit: BoxFit.scaleDown,
            ),
            points: ["non", "un peu", "oui", "tres"],
            prices: [
              0,
              0,
              0,
              30,
            ],
            defaut: 2),
      ],
      ings: [
        Ing(title: "frites", image: "assets/ing/frite.png"),
        Ing(title: "riz", image: "assets/ing/rice.png"),
        Ing(title: "Viande", image: "assets/ing/steak.png"),
        Ing(title: "poullet", image: "assets/ing/poullet.png"),
        Ing(title: "salad", image: "assets/ing/salad.png"),
      ],
      healths: [
        Health(title: "pour le diabète", stat: true),
        Health(title: "pour une femme enceinte", stat: true),
        Health(title: "pour votre regime", stat: true),
      ]),
  Food(
      name: "Tajin ziton",
      category: "plat traditionnelle",
      price: Price(priceNow: 100, priceFormat: PriceFormat.simple),
      disc:
          "Après 15 ans d'expérience dans la cuisine de ce plat pour de nombreux mariages et qui a remporté les éloges d'un public, je vous donne aujourd'hui l'opportunité de l'essayer",
      discRapide:
          "Le célèbre plat de tajine ziton par un chef spécialisé dans les mariages",
      image: "assets/proto/exp3.png",
      store: storesExamples[0],
      qntLimitDown: 1,
      qntLimitUp: 15,
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
            free: 1)
      ],
      configs: [
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
        Config(
          icon: Text(
            "souce",
            style: textStyleSimple.copyWith(color: mainColor),
          ),
          points: ["rouge clair", "rouge", "blanc"],
          prices: [0, 0, 0],
          defaut: 0,
        ),
      ],
      ings: [
        Ing(title: "Viande", image: "assets/ing/steak.png"),
        Ing(title: "olive", image: "assets/ing/olive.png"),
      ],
      healths: [
        Health(title: "pour le diabète", stat: true),
        Health(title: "pour une femme enceinte", stat: true),
        Health(title: "pour votre regime", stat: true),
      ]),
  Food(
      name: "Baklava",
      category: "gateaux",
      price: Price(priceNow: 50, priceFormat: PriceFormat.unit, unit: 1),
      disc:
          "Le baklava que tout le monde me demande de cuisiner pour eux, avec la recette traditionnelle et farci aux amandes",
      discRapide: "Délicieux baklawa d'un professionnel",
      image: "assets/proto/exp4.png",
      store: storesExamples[1],
      qntLimitUp: 50,
      qntLimitDown: 2,
      configs: [],
      ings: [
        Ing(title: "loz", image: "assets/ing/loz.png"),
        Ing(title: "honey", image: "assets/ing/honey.png"),
      ],
      healths: [
        Health(title: "pour le diabète", stat: false),
        Health(title: "pour une femme enceinte", stat: true),
        Health(title: "pour votre regime", stat: false),
      ]),
  Food(
      name: "crepe fruit",
      category: "dessert",
      price: Price(priceNow: 170, priceFormat: PriceFormat.unit, unit: 1),
      disc: "Crepe aux fruits et nutella",
      discRapide: "Crepe aux fruits et nutella",
      image: "assets/proto/exp4.jpg",
      store: storesExamples[1],
      qntLimitUp: 50,
      qntLimitDown: 1,
      configs: [
        Config(
            icon: Image.asset(
              "assets/ing/ananas.png",
              width: 30,
              fit: BoxFit.cover,
            ),
            points: ["non", "un peu", "tres"],
            prices: [
              0,
              0,
              25,
            ],
            defaut: 1),
        Config(
            icon: Image.asset(
              "assets/ing/fraise.png",
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
        Config(
            icon: Image.asset(
              "assets/ing/bais.png",
              width: 30,
              fit: BoxFit.cover,
            ),
            points: ["non", "un peu", "tres"],
            prices: [
              0,
              0,
              20,
            ],
            defaut: 1),
      ],
      ings: [
        Ing(title: "fruits", image: "assets/ing/fruits.png"),
        Ing(title: "chocola", image: "assets/ing/choco.png"),
      ],
      healths: [
        Health(title: "pour le diabète", stat: false),
        Health(title: "pour une femme enceinte", stat: true),
        Health(title: "pour votre regime", stat: false),
      ])
];

List<Food> tinderExamples = [foodExamples[3], foodExamples[0], foodExamples[1]];

List<Store> storesExamples = [
  Store(
      name: "Platacos Resto",
      rate: "3.4",
      disc:
          "Je suis Fares un chef professionnel, avec 8 ans d'expérience je vous accueille dans mon propre restaurant",
      image: "assets/proto/store.svg",
      background: "assets/proto/rb1.jpg",
      statut: "assets/proto/overt.png"),
  Store(
      name: "Sweet House",
      rate: "4.2",
      disc: "Desserts et gateaux à des prix très raisonnables",
      image: "assets/proto/store2.svg",
      background: "assets/proto/rb2.jpg",
      statut: "assets/proto/overt2.png")
];
