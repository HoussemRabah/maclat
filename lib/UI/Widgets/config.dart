import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/Logic/blocfood/food_bloc.dart';
import 'package:mbh/UI/Decoration/covers.dart';
import 'package:mbh/UI/Screens/login.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ConfigSlider extends StatefulWidget {
  final Config config;
  final int index;
  const ConfigSlider({Key? key, required this.config, required this.index})
      : super(key: key);

  @override
  State<ConfigSlider> createState() => _ConfigSliderState();
}

double _value = 0;
double _valueQnt = 1 / 50;

class _ConfigSliderState extends State<ConfigSlider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = widget.config.defaut / (widget.config.points.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Badge(
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
                child: SfSlider(
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
                    value: _value,
                    onChanged: (newValue) {
                      foodBloc.sups[widget.index] =
                          widget.config.prices[getIndexFromValue(newValue)];
                      foodBloc..add(FoodEEventRefresh());
                      setState(() {
                        _value = newValue;
                      });
                    }),
              ),
              SizedBox(
                width: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getIndex() {
    return (_value * (widget.config.points.length - 1)).ceil();
  }

  int getIndexFromValue(double value) {
    return (value * (widget.config.points.length - 1)).ceil();
  }
}

class QntSlider extends StatefulWidget {
  const QntSlider({Key? key}) : super(key: key);

  @override
  State<QntSlider> createState() => _QntSliderState();
}

class _QntSliderState extends State<QntSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Badge(
        alignment: Alignment.topCenter,
        shape: BadgeShape.square,
        badgeColor: mainColor,
        badgeContent: Text(
          "X${foodBloc.qnt}",
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
                onTap: () {
                  if (foodBloc.qnt != 1) {
                    {
                      foodBloc.qnt--;
                      _valueQnt = getValue((foodBloc.qnt));
                    }
                    setState(() {});
                    foodBloc.add(FoodEEventRefresh());
                  }
                },
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
                      foodBloc.qnt = getQnt(newValue);
                      foodBloc.add(FoodEEventRefresh());
                      setState(() {
                        _valueQnt = newValue;
                      });
                    }),
              ),
              GestureDetector(
                onTap: () {
                  if (foodBloc.qnt != 50) {
                    {
                      foodBloc.qnt++;
                      _valueQnt = getValue(foodBloc.qnt);
                    }
                    setState(() {});
                    foodBloc..add(FoodEEventRefresh());
                  }
                },
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
