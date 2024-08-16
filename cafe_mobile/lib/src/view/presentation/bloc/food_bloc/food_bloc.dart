import 'package:bloc/bloc.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/domain/use_case/food_usecase.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodUsecase usecase;
  FoodBloc(this.usecase) : super( InitialFoodState() ) {

    on<FoodEvent>((event, emit) async{
      emit(LoadingFoodState());
      try{
        await usecase.getAll()
          .then((value) => value is DataSuccess 
            ? emit(SuccessFoodState(value.data))
            : emit(FailFoodState(value.error ?? "Error Man")));
      }
      catch(e){ emit(FailFoodState(e.toString())); }
    });
    
  }
}
