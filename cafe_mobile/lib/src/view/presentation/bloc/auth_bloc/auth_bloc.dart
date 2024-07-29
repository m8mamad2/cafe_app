import 'package:bloc/bloc.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_login_req_model.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_signup_req_model.dart';
import 'package:cafe_mobile/src/view/domain/use_case/auth_usecase.dart';
import 'package:cafe_mobile/src/view/presentation/page/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthUseCase useCase;
  AuthBloc(this.useCase) : super( AuthStateSuccess() ) {
    
    on<AuthenticationEvent>((event, emit) async{
      emit(AuthStateLoading());
      try{
        await useCase.auth(event.loginModel, event.signupModel, event.isLogin)
          .then((value) => value is DataSuccess 
            ? emit(AuthStateSuccess())
            : emit(AuthStateFail(value.error)));
      }
      catch(e) { emit(AuthStateFail(e.toString())); }
    });

    on<AuthLogoutEvent>((event, emit) async{
      emit(AuthStateLoading());
      try{
        await useCase.logout();
        // ignore: use_build_context_synchronously
        event.context.navigateReplacement(const AuthScreen());
        emit(AuthStateSuccess());
      }
      catch(e) { emit(AuthStateFail(e.toString())); }
    });

  }
}
