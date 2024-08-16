import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/reservation_model.dart';

abstract class ReservationRepo {

  Future<DataState> getAllTable();
  Future<DataState> reserveTable(ReservationModel reservationModel);

}