import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbh/Core/constants.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

import '../../../Logic/Modules/food.dart';
import '../../../Logic/bloc/foodConfig/food_bloc.dart';
import '../../Screens/foodconfig.dart';

class Counter extends StatefulWidget {
  final Configuration configuration;

  const Counter({Key? key, required this.configuration}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return StepperSwipe(
        initialValue: widget.configuration.qnt,
        minValue: widget.configuration.qntLimitDown ?? 1,
        maxValue: widget.configuration.qntLimitUp ?? 50,
        iconsColor: mainColor,
        counterTextColor: inColor,
        dragButtonColor: mainColor,
        onChanged: (newValue) {
          foodBloc.add(FoodEventUpdateConfigurationQnt(
              configuration: widget.configuration, newValue: newValue));
        },
        stepperValue: 1);
  }
}
