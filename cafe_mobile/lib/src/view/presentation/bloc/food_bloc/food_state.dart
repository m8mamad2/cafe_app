part of 'food_bloc.dart';

@immutable
sealed class FoodState {}

final class InitialFoodState extends FoodState {}

final class LoadingFoodState extends FoodState {}

final class SuccessFoodState extends FoodState {
  final List<FoodModel> foodData;
  SuccessFoodState(this.foodData);
}

final class FailFoodState extends FoodState {
  final String error;
  FailFoodState(this.error);
}
