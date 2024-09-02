import 'package:cafe_mobile/src/core/data_source/remote/api_configure.dart';
import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/geocoding_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/geocoding_repo.dart';

class GeocodingRepoImpl extends GeocodingRepo{
  final Api api;
  GeocodingRepoImpl(this.api);

  @override
  Future<DataState> getAddress(double lat, double long) async {
    final res = await api.get( ApiEndPoints.kGeocodinUrl(lat, long));
    if(res is DataSuccess){
      final parseDat =  GeocodingModel.fromJson(res.data.data);
      return DataSuccess( parseDat );
    } 
    else return res;
  }

}