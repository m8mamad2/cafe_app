part of 'reservation_bloc.dart';

@immutable
sealed class ReservationState {}

final class InitialReservationState extends ReservationState {}

final class LoadingReservationState extends ReservationState {}

final class SuccessReservationState extends ReservationState {
  final List<ReservationModel> reservationModel;
  SuccessReservationState(this.reservationModel);
}

final class SuccessCreateTableReservationState extends ReservationState {}

final class FailReservationState extends ReservationState {
  final String error;
  FailReservationState(this.error);
}
