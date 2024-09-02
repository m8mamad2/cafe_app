import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_login_req_model.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_signup_req_model.dart';
import 'package:cafe_mobile/src/view/domain/repo/auth_repo.dart';

class AuthUseCase{

  final AuthRepo repo;
  AuthUseCase(this.repo);

  Future<DataState> auth(AuthLoginReqModel? loginModel, AuthSignupReqModel? signupModel, bool isLogin)=>  repo.auth(loginModel, signupModel, isLogin);
  Future<DataState> currentUser(bool needGetFromServer)=> repo.currentUser(needGetFromServer);
  Future<bool> logout()=> repo.logout();
  Future<DataState> updateUser(Map<String,dynamic> data)=> repo.updateUser(data);

}