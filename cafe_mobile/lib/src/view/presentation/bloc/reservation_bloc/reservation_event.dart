part of 'reservation_bloc.dart';

@immutable
sealed class ReservationEvent {}


final class GetAllTableReservationEvent extends ReservationEvent { }

final class CreateTableReservationEvent extends ReservationEvent { 
  final ReservationReqModel reservationModel;
  CreateTableReservationEvent(this.reservationModel);
}