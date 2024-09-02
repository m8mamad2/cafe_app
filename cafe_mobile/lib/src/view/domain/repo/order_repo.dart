import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/order_model.dart';

abstract class OrderRepo {

  Future<DataState> getAllOrders();
  Future<DataState> addToOrder(List<OrderModel> orderModel);
  Future<DataState> completeOrder(List<int> orderIds);

}