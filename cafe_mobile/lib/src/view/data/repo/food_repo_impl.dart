


import 'package:cafe_mobile/src/core/data_source/remote/api_configure.dart';
import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/food_repo.dart';

class FoodRepoImpl extends FoodRepo {

  final Api api;
  FoodRepoImpl(this.api);
  
  
  @override
  Future<DataState> getAllFood() async{
    final res = await api.get( ApiEndPoints.kGetAllFoodUrl );
    if(res is DataSuccess){
      final parseData = (res.data.data as List).map((e) => FoodModel.fromJson(e),).toList();
      return DataSuccess(parseData);
    }
    else return res;
  }

}