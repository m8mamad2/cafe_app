part of 'food_bloc.dart';

@immutable
sealed class FoodEvent {}

final class GetAllFoodEvent extends FoodEvent { }