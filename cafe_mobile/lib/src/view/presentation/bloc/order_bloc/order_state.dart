part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

final class InitialOrderState extends OrderState {}

final class LoadingOrderState extends OrderState {}

final class SuccessOrderState extends OrderState {
  final List<OrderModel> orderData;
  SuccessOrderState(this.orderData);
}

final class SuccessAddOrderState extends OrderState {}

final class FailOrderState extends OrderState {
  final String error;
  FailOrderState(this.error);
}
