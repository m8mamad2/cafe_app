import 'package:bloc/bloc.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/local/user_model.dart';
import 'package:cafe_mobile/src/view/domain/use_case/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  AuthUseCase useCase;
  UserBloc(this.useCase) : super(InitialUserState()) {
    
    on<CurrentUserEvent>((event, emit)async {
      emit(LoadingUserState());
      try{
        await useCase.currentUser(event.needGetFromServer)
          .then((value) => value is DataSuccess 
            ? emit( SuccessUserState(value.data)) 
            : emit( FailUserState(value.error ?? 'Error Man')));
      }
      catch(e){ emit(FailUserState(e.toString())); }
    });

    on<UpdateUserEvent>((event, emit)async {
      emit(LoadingUserState());
      try{
        await useCase.updateUser(event.key, event.value)
          .then((value) => value is DataSuccess 
            ? emit( SuccessUserState(value.data)) 
            : emit( FailUserState(value.error ?? 'Error Man')));
      }
      catch(e){ emit(FailUserState(e.toString())); }
    });

  }
}
