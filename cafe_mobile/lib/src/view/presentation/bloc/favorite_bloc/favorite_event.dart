part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}


final class GetAllFavoriteEvent extends FavoriteEvent {}

final class AddFavoriteEvent extends FavoriteEvent {
  final FavoriteModel favoriteModel;
  AddFavoriteEvent(this.favoriteModel);
}

final class ClearAllFavoriteEvent extends FavoriteEvent { }

final class DeleteFavoriteEvent extends FavoriteEvent {
  final int id;
  DeleteFavoriteEvent(this.id);
}
