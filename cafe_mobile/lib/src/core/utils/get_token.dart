
import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/local/user_model.dart';
import 'package:isar/isar.dart';

class GetToken{
  static Future<String?> getToken()async{
    try{
      final res = await LocalDb.isar.userModels.where().findAll();
      final token = res.last.access_token;
      return token == null || token.isEmpty ? null : token;
    }
    catch(e){
      return null;
    }
  }
}