part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}


class GetAllCartsEvent extends CartEvent {}

class AddToCartsEvent extends CartEvent {
  final CartModel cartModel;
  AddToCartsEvent(this.cartModel);
}

class DeleteFromCartsEvent extends CartEvent {
  final int id;
  DeleteFromCartsEvent(this.id);
}

class ClearCartModel extends CartEvent {}

class IncCartEvent extends CartEvent {
  final int id;
  final bool isInc;
  IncCartEvent(this.id, this.isInc);
}