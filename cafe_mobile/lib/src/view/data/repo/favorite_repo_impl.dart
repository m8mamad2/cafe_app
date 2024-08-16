import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/favorite_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/favorite_repo.dart';
import 'package:isar/isar.dart';

class FavoriteRepoImpl extends FavoriteRepo{
  
  @override
  Future<DataState> getAllFavorites() async {
    try{
      final res = await LocalDb.isar.favoriteModels.where().findAll();
      return DataSuccess(res);
    }
    catch(e){ return DataFailed(e.toString()); }
  }

  @override
  Future<DataState> addToFavorite(FavoriteModel foodModel) async{
    try{
      await LocalDb.isar.writeTxn(() async=> await LocalDb.isar.favoriteModels.put(foodModel));
      final res = await LocalDb.isar.favoriteModels.where().findAll();
      return DataSuccess(res);
    }
    catch(e){ 
      return const DataFailed('error'); }
  }

  @override
  Future<DataState> clearFavorites() async{
    try{
      await LocalDb.isar.writeTxn(() => LocalDb.isar.favoriteModels.clear());
      final res = await LocalDb.isar.favoriteModels.where().findAll();
      return DataSuccess(res);
    }
    catch(e){ return const DataFailed('error'); }
  }

  @override
  Future<DataState> remoteFromFavorite(int foodModelId) async{
    try{
      // await LocalDb.isar.writeTxn(() async => await LocalDb.isar.cartModels.filter().idEqualTo(cartModelId).deleteAll())
      await LocalDb.isar.writeTxn(() async => await LocalDb.isar.favoriteModels.filter().idEqualTo(foodModelId).deleteAll());
      final res = await LocalDb.isar.favoriteModels.where().findAll();
      return DataSuccess(res);
    }
    catch(e){ return const DataFailed('error'); }
  }
  
    
}