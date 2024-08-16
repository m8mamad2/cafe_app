import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/cart_repo.dart';
import 'package:isar/isar.dart';

class CartRepoImpl extends CartRepo{
  
  @override
  Future<DataState> getAllCarts() async {
    try{
      final res = await LocalDb.isar.cartModels.where().findAll();
      return DataSuccess(res);
    }
    catch(e){ return DataFailed(e.toString()); }
  }

  @override
  Future<DataState> addToCart(CartModel cartModel) async{
    try{
      await LocalDb.isar.writeTxn(() async=> await LocalDb.isar.cartModels.put(cartModel));
      final res = await LocalDb.isar.cartModels.where().findAll();
      return DataSuccess(res);
    }
    catch(e){ 
      print("erro in REpo ${e.toString()}");
      return const DataFailed('error'); }
  }

  @override
  Future<DataState> clearCart() async{
    try{
      await LocalDb.isar.writeTxn(() => LocalDb.isar.cartModels.clear());
      final res = await LocalDb.isar.cartModels.where().findAll();
      return DataSuccess(res);
    }
    catch(e){ return const DataFailed('error'); }
  }

  @override
  Future<DataState> remoteFromCart(int cartModelId) async{
    try{
      await LocalDb.isar.writeTxn(() async => await LocalDb.isar.cartModels.filter().idEqualTo(cartModelId).deleteAll());
      final res = await LocalDb.isar.cartModels.where().findAll();
      return  DataSuccess(res);
    }
    catch(e){ return const DataFailed('error'); }
  }
 
  @override
  Future<DataState> incCart(int id, bool isInc) async{
    try{
      
      final cartModel = await LocalDb.isar.cartModels.get(id);
      if(cartModel != null){
        await LocalDb.isar.writeTxn(() async{
          isInc 
            ? cartModel.howMuch += 1 
            : cartModel.howMuch -= 1;
          await LocalDb.isar.cartModels.put(cartModel);
        });
      }
      final res = await LocalDb.isar.cartModels.where().findAll();
      return DataSuccess(res);
    }
    catch(e){ 
      print("erro in REpo ${e.toString()}");
      return const DataFailed('error'); }
  }
}