import 'package:flutter_bloc/flutter_bloc.dart';

part 'food_event.dart';

part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  int prixtotal;
  int prix = 200;
  List<int> sups = [0, 0, 0, 0];
  int qnt = 1;
  FoodBloc({required this.prixtotal}) : super(FoodInitial()) {
    on<FoodEvent>((event, emit) {
      if (event is FoodEEventRefresh) {
        prixtotal = (prix) + sups[0] + sups[1] + sups[2] + sups[3];
        emit(FoodInitial());
      }
    });
  }
}
