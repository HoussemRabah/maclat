import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbh/Logic/Modules/food.dart';

part 'food_event.dart';

part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodOrdre foodOrdre;
  FoodBloc({required this.foodOrdre}) : super(FoodInitial()) {
    on<FoodEvent>((event, emit) {
      if (event is FoodEventAddConfiguration) {
        emit(FoodStateLoading());
        foodOrdre.addConfiguration();
        emit(FoodStateLoaded());
      }

      if (event is FoodEventRemoveConfiguration) {
        emit(FoodStateLoading());
        foodOrdre.removeConfiguration(event.index);
        emit(FoodStateLoaded());
      }

      if (event is FoodEventUpdateConfiguration) {
        emit(FoodStateLoading());
        foodOrdre.updateConfiguration(
            configuration: event.configuration, index: event.index);
        emit(FoodStateLoaded());
      }
    });
  }
}
