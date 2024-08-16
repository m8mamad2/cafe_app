import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/favorite_model.dart';

abstract class FavoriteRepo{

  Future<DataState> getAllFavorites( );
  Future<DataState> addToFavorite(FavoriteModel foodModel);
  Future<DataState> remoteFromFavorite(int foodModelId);
  Future<DataState> clearFavorites();

}