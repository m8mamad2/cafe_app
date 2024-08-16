import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/cart_repo.dart';

class CartUsecase {

  final CartRepo repo;
  CartUsecase(this.repo);

  Future<DataState> getAllCart()=> repo.getAllCarts();
  Future<DataState> addToCart(CartModel foodModel)=> repo.addToCart(foodModel);
  Future<DataState> removeFromCart(int foodModelId)=> repo.remoteFromCart(foodModelId);
  Future<DataState> clearCarts()=> repo.clearCart();
  Future<DataState> incCart(int id, bool isInc) => repo.incCart(id, isInc);
}