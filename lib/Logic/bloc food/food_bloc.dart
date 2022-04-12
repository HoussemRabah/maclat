import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  int prixtotal;
  int qnt = 1;
  FoodBloc({required this.prixtotal}) : super(FoodInitial()) {
    on<FoodEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
