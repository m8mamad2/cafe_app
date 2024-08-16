import 'package:cafe_mobile/src/view/data/model/auth_model/local/user_model.dart';
import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:cafe_mobile/src/view/data/model/favorite_model.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDb{

  static late Isar isar;

  static Future initDatabase()async{

    if(Isar.instanceNames.isEmpty){
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open( 
        [ UserModelSchema, FoodModelSchema, FavoriteModelSchema, CartModelSchema ],  
        directory: dir.path);
    }
    isar = Isar.getInstance()!;
  }

}

