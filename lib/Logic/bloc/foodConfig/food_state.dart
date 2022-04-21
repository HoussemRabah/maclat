part of 'food_bloc.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodStateLoading extends FoodState {}

class FoodStateLoaded extends FoodState {}
