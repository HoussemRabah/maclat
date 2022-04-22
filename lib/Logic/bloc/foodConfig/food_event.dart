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

class FoodEventUpdateConfig extends FoodEvent {
  final Config config;
  final double newValue;
  FoodEventUpdateConfig({required this.config, required this.newValue})
      : super();
}

class FoodEventUpdateConfigurationQnt extends FoodEvent {
  final Configuration configuration;
  final int newValue;
  FoodEventUpdateConfigurationQnt(
      {required this.configuration, required this.newValue})
      : super();
}

class FoodEventUpdateConfigurationQntAdd extends FoodEvent {
  final Configuration configuration;
  FoodEventUpdateConfigurationQntAdd({required this.configuration}) : super();
}

class FoodEventUpdateConfigurationQntSub extends FoodEvent {
  final Configuration configuration;
  FoodEventUpdateConfigurationQntSub({required this.configuration}) : super();
}

class FoodEventRefresh extends FoodEvent {}
