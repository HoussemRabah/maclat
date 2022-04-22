import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/Logic/bloc/foodConfig/food_bloc.dart';
import 'package:mbh/UI/Decoration/covers.dart';
import 'package:mbh/UI/Screens/foodconfig.dart';
import 'package:mbh/UI/Screens/login.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ConfigSlider extends StatefulWidget {
  final Config config;
  const ConfigSlider({Key? key, required this.config}) : super(key: key);

  @override
  State<ConfigSlider> createState() => _ConfigSliderState();
}

class _ConfigSliderState extends State<ConfigSlider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      alignment: Alignment.topCenter,
      shape: BadgeShape.square,
      showBadge: (widget.config.prices[getIndex()] != 0),
      badgeContent: (widget.config.prices[getIndex()] == 0)
          ? null
          : Text(
              "+${widget.config.prices[getIndex()]}DA",
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
            Sqaure(child: widget.config.icon),
            Expanded(
              child: new SfSlider(
                  showDividers: true,
                  interval: 1.0 / (widget.config.points.length - 1),
                  stepSize: 1.0 / (widget.config.points.length - 1),
                  showLabels: true,
                  activeColor: mainColor,
                  inactiveColor: inColor,
                  labelPlacement: LabelPlacement.onTicks,
                  labelFormatterCallback: (value, formateur) {
                    return "${widget.config.points[getIndexFromValue(value)]}";
                  },
                  value: widget.config.value,
                  onChanged: (newValue) {
                    foodBloc.add(FoodEventUpdateConfig(
                        config: widget.config, newValue: newValue));
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
    return (widget.config.value * (widget.config.points.length - 1)).ceil();
  }

  int getIndexFromValue(double value) {
    return (value * (widget.config.points.length - 1)).ceil();
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
                    min: 1 / (widget.configuration.qntLimitUp ?? 50),
                    showDividers: true,
                    showLabels: true,
                    activeColor: mainColor,
                    inactiveColor: inColor,
                    labelPlacement: LabelPlacement.onTicks,
                    labelFormatterCallback: (value, formateur) {
                      return "${getQnt(value)}";
                    },
                    value: widget.configuration.qnt,
                    onChanged: (newValue) {
                      foodBloc.add(FoodEventUpdateConfigurationQnt(
                          configuration: widget.configuration,
                          newValue: getQnt(newValue)));
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
