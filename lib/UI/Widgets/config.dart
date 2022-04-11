import 'package:flutter/material.dart';
import 'package:mbh/Core/constants.dart';
import 'package:mbh/Logic/Modules/food.dart';
import 'package:mbh/UI/Decoration/covers.dart';

class ConfigSlider extends StatefulWidget {
  final Config config;
  const ConfigSlider({Key? key, required this.config}) : super(key: key);

  @override
  State<ConfigSlider> createState() => _ConfigSliderState();
}

class _ConfigSliderState extends State<ConfigSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 69,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: radius, boxShadow: shadows, color: inColor),
            child: Row(
              children: [
                Sqaure(child: widget.config.icon),
                Slider(
                    thumbColor: mainColor,
                    activeColor: mainColor,
                    inactiveColor: inColor,
                    divisions: widget.config.points.length,
                    value: widget.config.defaut / widget.config.points.length,
                    onChanged: (newValue) {}),
                SizedBox(
                  width: 8.0,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Sqaure(
              child: Text(
            widget.config.points[0],
            style: textStyleSimple,
          )),
        ],
      ),
    );
  }
}
