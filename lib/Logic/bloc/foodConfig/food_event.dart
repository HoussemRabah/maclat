part of 'food_bloc.dart';

abstract class FoodEvent {}

class FoodEventInit extends FoodEvent {}

class FoodEventAddConfiguration extends FoodEvent {}

class FoodEventRemoveConfiguration extends FoodEvent {
  final int index;
  FoodEventRemoveConfiguration({required this.index}) : super();
}

class FoodEventUpdateConfiguration extends FoodEvent {
  final int index;
  final Configuration configuration;
  FoodEventUpdateConfiguration(
      {required this.index, required this.configuration})
      : super();
}

class FoodEventRefresh extends FoodEvent {}
