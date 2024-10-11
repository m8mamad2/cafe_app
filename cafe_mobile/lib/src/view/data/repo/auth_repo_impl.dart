
import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/core/data_source/remote/api_configure.dart';
import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_login_req_model.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/local/user_model.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_signup_req_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/auth_repo.dart';
import 'package:isar/isar.dart';

class AuthRepoImpl extends AuthRepo {

  final Api api;
  AuthRepoImpl( this.api );
  
  @override
  Future<DataState> auth(AuthLoginReqModel? loginModel, AuthSignupReqModel? signupModel, bool isLogin) async{
    
    final res = await api.post(
      isLogin ?  ApiEndPoints.kLoginUrl : ApiEndPoints.kSignupUrl, 
      isLogin ?  loginModel!.toJson()   : signupModel!.toJson() );

    if(res is DataSuccess){
      final UserModel parse = UserModel.fromJson(res.data.data);
      LocalDb.isar.writeTxn(() async => await LocalDb.isar.userModels.put(parse));
      return DataSuccess(parse);
    }
    else return res;
  }
  
  @override
  Future<bool> logout()async {
    try{
      await LocalDb.isar.writeTxn(() => LocalDb.isar.userModels.clear());
      return true;
    }
    catch(e){ return false; }
  }

  @override
  Future<DataState> currentUser(bool needGetFromServer)async{
    try{
      if(needGetFromServer) return await getCurrentUserFromServer();
      else{
        final res = await LocalDb.isar.userModels.where().findAll();
        return DataSuccess(res.last);
      }
    }
    catch(e){ return DataFailed(e.toString()); }
  }

  @override
  Future<DataState> updateUser(Map<String, dynamic> data)async{
    final res = await api.put(ApiEndPoints.kUpdateUserUrl, data);
    if(res is DataSuccess) return await getCurrentUserFromServer();
    else return res;
  }

  Future<DataState> getCurrentUserFromServer() async{
    final res = await api.get(ApiEndPoints.kGetCurrentUserUrl);
    if(res is DataSuccess){
      final UserModel parse = UserModel.fromJson(res.data.data);
      await LocalDb.isar.writeTxn(() async => await LocalDb.isar.userModels.put(parse));
      final dataRes = await LocalDb.isar.userModels.where().findAll();
      return DataSuccess(dataRes.last);
    }
    else return DataFailed(res.error ?? "Some Erro Csmes in Get User");
  }

}