import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Decoration/covers.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ConfigSlider extends StatefulWidget {
  final Config config;
  const ConfigSlider({Key? key, required this.config}) : super(key: key);

  @override
  State<ConfigSlider> createState() => _ConfigSliderState();
}

double _value = 0;

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
