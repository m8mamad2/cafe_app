import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/favorite_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/favorite_repo.dart';

class FavoriteUsecase {

  final FavoriteRepo repo;
  FavoriteUsecase(this.repo);

  Future<DataState> getAllFavorite()=> repo.getAllFavorites();
  Future<DataState> addToFavorite(FavoriteModel foodModel)=> repo.addToFavorite(foodModel);
  Future<DataState> removeFromFavorite(int foodModelId)=> repo.remoteFromFavorite(foodModelId);
  Future<DataState> clearFavorites()=> repo.clearFavorites();
  
}