import 'package:bloc/bloc.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/favorite_model.dart';
import 'package:cafe_mobile/src/view/domain/use_case/favorite_usecase.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {

  final FavoriteUsecase usecase;
  FavoriteBloc(this.usecase) : super( InitialFavoriteState() ) {
    
    on<GetAllFavoriteEvent>((event, emit) async{
      emit(LoadingFavoriteState());
      try{
        await usecase.getAllFavorite()
          .then((value) => value is DataSuccess
            ? emit(SuccessFavoriteState(value.data))
            : emit(FailFavoriteState(value.error ?? "error")));
      }
      catch(e){ emit(FailFavoriteState(e.toString())); }
     });

    on<AddFavoriteEvent>((event, emit) async{
      try{
        await usecase.addToFavorite(event.favoriteModel)
          .then((value) => value is DataSuccess
            ? emit(SuccessFavoriteState(value.data))
            : emit(FailFavoriteState(value.error ?? "error")));
      }
      catch(e){ emit(FailFavoriteState(e.toString())); }
     });

    on<ClearAllFavoriteEvent>((event, emit) async{
      emit(LoadingFavoriteState());
      try{
        await usecase.clearFavorites()
          .then((value) => value is DataSuccess
            ? emit(SuccessFavoriteState(value.data))
            : emit(FailFavoriteState(value.error ?? "error")));
      }
      catch(e){ emit(FailFavoriteState(e.toString())); }
     });

    on<DeleteFavoriteEvent>((event, emit) async{
      try{
        await usecase.removeFromFavorite(event.id)
          .then((value) => value is DataSuccess
            ? emit(SuccessFavoriteState(value.data))
            : emit(FailFavoriteState(value.error ?? "error")));
      }
      catch(e){ emit(FailFavoriteState(e.toString())); }
     });

  }
}
