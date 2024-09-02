import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/order_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/order_repo.dart';

class OrderUsecase {
  final OrderRepo orderRepo;
  OrderUsecase(this.orderRepo);

  Future<DataState> getAllOrders()=> orderRepo.getAllOrders();
  Future<DataState> addToOrder(List<OrderModel> orderModel)=> orderRepo.addToOrder(orderModel);
  Future<DataState> completeOrder(List<int> orderId)=> orderRepo.completeOrder(orderId);
  
}