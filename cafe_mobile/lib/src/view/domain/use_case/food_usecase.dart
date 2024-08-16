import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/domain/repo/food_repo.dart';

class FoodUsecase {

  final FoodRepo repo;
  FoodUsecase(this.repo);
  
  Future<DataState> getAll()=> repo.getAllFood();
  
}