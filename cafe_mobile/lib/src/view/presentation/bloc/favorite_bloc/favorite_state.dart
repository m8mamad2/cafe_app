part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

final class InitialFavoriteState extends FavoriteState {}

final class LoadingFavoriteState extends FavoriteState {}

final class SuccessFavoriteState extends FavoriteState {
  final List<FavoriteModel>? favoriteData;
  SuccessFavoriteState(this.favoriteData);
}

final class FailFavoriteState extends FavoriteState {
  final String error;
  FailFavoriteState(this.error);
}
