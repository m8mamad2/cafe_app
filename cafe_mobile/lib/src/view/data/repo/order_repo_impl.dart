import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/order_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/order_repo.dart';

import '../../../core/data_source/remote/api_configure.dart';

class OrderRepoImpl  extends OrderRepo{
  final Api api;
  OrderRepoImpl(this.api);

  @override
  Future<DataState> addToOrder(List<OrderModel> orderModel) async {
    final parseData = orderModel.map((e)=> e.toJson()).toList();
    final res = await api.post(ApiEndPoints.kAddOrderOUrl, parseData);
    if(res is DataSuccess) return getAllOrders();
    else return res;
  }

  @override
  Future<DataState> completeOrder(List<int> orderIds)async {
    final res = await api.post(ApiEndPoints.kCompleteOrderOUrl, { "ids" : orderIds });
    if(res is DataSuccess)return getAllOrders();
    else return res;
  }

  @override
  Future<DataState> getAllOrders() async{
    final res = await api.get(ApiEndPoints.kGetAllOrderUrl);
    if(res is DataSuccess){
      final parse = (res.data.data as List).map((e)=> OrderModel.fromJson(e)).toList();
      return DataSuccess(parse);
    }
    else return res;
  }
  
}