import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';

abstract class GeocodingRepo {
  Future<DataState> getAddress(double lat, double long);
}