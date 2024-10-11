import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_login_req_model.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_signup_req_model.dart';

abstract class AuthRepo{
  Future<DataState> auth(AuthLoginReqModel? loginModel, AuthSignupReqModel? signupModel, bool isLogin);
  Future<bool> logout();
  Future<DataState> currentUser(bool needGetFromServer);
  Future<DataState> updateUser(Map<String, dynamic> data);
}