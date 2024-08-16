import 'package:cafe_mobile/src/core/data_source/remote/api_configure.dart';
import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/reservation_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/reservation_repo.dart';

class ReservationRepoImpl extends ReservationRepo{
  
  final Api api;
  ReservationRepoImpl(this.api);
  
  @override
  Future<DataState> getAllTable() async{
    final res = await api.get( ApiEndPoints.kGetAllReservationUrl );
    if(res is DataSuccess){
      final List<ReservationModel> data = (res.data.data as List).map((e)=> ReservationModel.fromJson(e)).toList();
      return DataSuccess(data);
    }
    else return res;
  }

  @override
  Future<DataState> reserveTable(ReservationModel reservationModel)async {
    return await api.post( ApiEndPoints.kGetAllReservationUrl, reservationModel.toJson() );
  }

}