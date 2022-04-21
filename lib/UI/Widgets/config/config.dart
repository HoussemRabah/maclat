import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Decoration/covers.dart';
import 'package:mbh/UI/Screens/foodconfig.dart';
import 'package:mbh/UI/Screens/login.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ConfigSlider extends StatefulWidget {
  final int configurationIndex;
  final int configIndex;
  const ConfigSlider(
      {Key? key, required this.configurationIndex, required this.configIndex})
      : super(key: key);

  @override
  State<ConfigSlider> createState() => _ConfigSliderState();
}

double _valueQnt = 1 / 50;

late Config config;

class _ConfigSliderState extends State<ConfigSlider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    config = foodBloc.foodOrdre.configurations[widget.configurationIndex]
        .configs[widget.configIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      alignment: Alignment.topCenter,
      shape: BadgeShape.square,
      showBadge: (config.prices[getIndex()] != 0),
      badgeContent: (config.prices[getIndex()] == 0)
          ? null
          : Text(
              "+${config.prices[getIndex()]}DA",
              style: textStyleSmall.copyWith(color: inColor),
            ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 69 + 8.0 + 8.0,
        width: MediaQuery.of(context).size.width - 16.0 * 2,
        decoration: BoxDecoration(
            borderRadius: radius, boxShadow: shadows, color: inColor),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Sqaure(child: config.icon),
            Expanded(
              child: SfSlider(
                  showDividers: true,
                  interval: 1.0 / (config.points.length - 1),
                  stepSize: 1.0 / (config.points.length - 1),
                  showLabels: true,
                  activeColor: mainColor,
                  inactiveColor: inColor,
                  labelPlacement: LabelPlacement.onTicks,
                  labelFormatterCallback: (value, formateur) {
                    return "${config.points[getIndexFromValue(value)]}";
                  },
                  value: config.value,
                  onChanged: (newValue) {
                    config.value = newValue;
                  }),
            ),
            SizedBox(
              width: 12.0,
            ),
          ],
        ),
      ),
    );
  }

  int getIndex() {
    return (config.value * (config.points.length - 1)).ceil();
  }

  int getIndexFromValue(double value) {
    return (value * (config.points.length - 1)).ceil();
  }
}

class QntSlider extends StatefulWidget {
  final Configuration configuration;
  const QntSlider({Key? key, required this.configuration}) : super(key: key);

  @override
  State<QntSlider> createState() => _QntSliderState();
}

class _QntSliderState extends State<QntSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0.0),
      child: Badge(
        alignment: Alignment.topCenter,
        shape: BadgeShape.square,
        badgeColor: mainColor,
        badgeContent: Text(
          "X${widget.configuration.qnt}",
          style: textStyleSmall.copyWith(color: inColor),
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: 69 + 8.0 + 8.0,
          width: MediaQuery.of(context).size.width - 16.0 * 2,
          decoration: BoxDecoration(
              borderRadius: radius, boxShadow: shadows, color: inColor),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: radius,
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    LineIcons.minus,
                    color: inColor,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                child: SfSlider(
                    min: 1 / 50,
                    showDividers: true,
                    showLabels: true,
                    activeColor: mainColor,
                    inactiveColor: inColor,
                    labelPlacement: LabelPlacement.onTicks,
                    labelFormatterCallback: (value, formateur) {
                      return "${getQnt(value)}";
                    },
                    value: _valueQnt,
                    onChanged: (newValue) {
                      setState(() {
                        _valueQnt = newValue;
                      });
                    }),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: radius,
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    LineIcons.plus,
                    color: inColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getQnt(double value) {
    return (value * 50).floor();
  }

  double getValue(int value) {
    return (value / 50);
  }
}
