import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/domain/repo/geocoding_repo.dart';

class GeocodingUsecase {
  final GeocodingRepo repo;
  GeocodingUsecase(this.repo);
  
  Future<DataState> getAddress(double lat,double long)=> repo.getAddress(lat, long);
  
}