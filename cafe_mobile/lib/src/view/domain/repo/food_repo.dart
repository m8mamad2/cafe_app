import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';

abstract class FoodRepo{
  Future<DataState> getAllFood();
}