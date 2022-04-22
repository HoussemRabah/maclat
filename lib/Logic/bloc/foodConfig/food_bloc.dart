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

      if (event is FoodEventUpdateConfig) {
        emit(FoodStateLoading());
        event.config.value = event.newValue;
        emit(FoodStateLoaded());
      }
      if (event is FoodEventUpdateConfigurationQnt) {
        emit(FoodStateLoading());
        event.configuration.qnt = event.newValue;
        emit(FoodStateLoaded());
      }
      if (event is FoodEventUpdateConfigurationQntAdd) {
        emit(FoodStateLoading());
        if (event.configuration.qnt != (event.configuration.qntLimitUp ?? 50))
          event.configuration.qnt++;
        emit(FoodStateLoaded());
      }
      if (event is FoodEventUpdateConfigurationQntSub) {
        emit(FoodStateLoading());
        if (event.configuration.qnt != (event.configuration.qntLimitDown ?? 1))
          event.configuration.qnt--;
        emit(FoodStateLoaded());
      }

      if (event is FoodEventSupAdd) {
        if (event.sup.count != event.sup.limitDown) {
          {
            event.sup.count--;
            emit(FoodStateLoaded());
          }
        }
      }

      if (event is FoodEventSupSub) {
        if (event.sup.count != event.sup.limit) {
          {
            event.sup.count++;
            emit(FoodStateLoaded());
          }
        }
      }
    });
  }
}
