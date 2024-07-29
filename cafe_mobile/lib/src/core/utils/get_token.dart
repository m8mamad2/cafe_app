import 'dart:developer';

import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/local/user_model.dart';
import 'package:isar/isar.dart';

class GetToken{
  static Future<bool> getToken()async{
    try{
      final res = await LocalDb.isar.userModels.where().findAll();
      final token = res[0].access_token;
      log(token.toString());
      return token == null || token.isEmpty ? false : true;
    }
    catch(e){
      return false;
    }
  }
}