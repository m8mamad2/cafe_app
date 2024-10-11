part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

final class GetAllOrderEvent extends OrderEvent { }

final class AddOrderEvent extends OrderEvent {
  final List<OrderModel> orderModel;
  AddOrderEvent(this.orderModel);
}

final class CompleteOrderEvent extends OrderEvent { 
  final List<int> orderId;
  CompleteOrderEvent(this.orderId);
}

final class GetLocationOrderEvent extends OrderEvent {  }