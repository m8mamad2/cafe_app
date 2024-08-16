import 'package:bloc/bloc.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/reservation_model.dart';
import 'package:cafe_mobile/src/view/domain/use_case/reservation_usecase.dart';
import 'package:meta/meta.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final ReservationUsecase usecase;
  ReservationBloc(this.usecase) : super(InitialReservationState()) {

    on<GetAllTableReservationEvent>((event, emit) async{
      emit(LoadingReservationState());
      try{
        await usecase.getAllTable().then((value) => 
          value is DataSuccess 
            ? emit(SuccessReservationState(value.data))
            : emit(FailReservationState(value.error ?? 'Tere is Error')));
      }
      catch(e){ emit(FailReservationState(e.toString())); }
    });

    on<CreateTableReservationEvent>((event, emit) async{
      emit(LoadingReservationState());
      try{
        await usecase.reserveTable(event.reservationModel).then((value) => 
          value is DataSuccess 
            ? emit(SuccessCreateTableReservationState())
            : emit(FailReservationState(value.error ?? 'Tere is Error')));
      }
      catch(e){ emit(FailReservationState(e.toString())); }
    });
    
  }
}
