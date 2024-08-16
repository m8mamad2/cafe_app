part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthenticationEvent extends AuthEvent{
  
  final AuthLoginReqModel? loginModel;
  final AuthSignupReqModel? signupModel;
  final bool isLogin;

  AuthenticationEvent(this.loginModel, this.signupModel, this.isLogin);
}

class AuthLogoutEvent extends AuthEvent {
  final BuildContext context;
  AuthLogoutEvent(this.context);
}

