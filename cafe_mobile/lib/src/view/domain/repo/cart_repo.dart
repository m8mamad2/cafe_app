import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/cart_model.dart';

abstract class CartRepo{

  Future<DataState> getAllCarts( );
  Future<DataState> addToCart(CartModel cartModel);
  Future<DataState> remoteFromCart(int cartModelId);
  Future<DataState> clearCart();
  Future<DataState> incCart(int id, bool isInc);

}