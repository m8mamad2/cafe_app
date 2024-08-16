part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class InitialCartState extends CartState {}

final class LoadingCartState extends CartState {}

final class SuccessCartState extends CartState {
  final List<CartModel>? cartModels;
  SuccessCartState(this.cartModels);
}

final class FailCartState extends CartState {
  final String error;
  FailCartState(this.error);
}
