import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/reservation_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/reservation_repo.dart';

class ReservationUsecase {

  final ReservationRepo repo;
  ReservationUsecase(this.repo);
  
  Future<DataState> getAllTable()=>repo.getAllTable();
  Future<DataState> reserveTable(ReservationModel reservationModel)=>repo.reserveTable(reservationModel);

}