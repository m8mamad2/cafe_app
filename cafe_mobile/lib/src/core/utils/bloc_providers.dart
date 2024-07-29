import 'package:cafe_mobile/src/config/locator.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

blocProviders(Widget child)=> MultiBlocProvider(
  
  providers: [
    BlocProvider<AuthBloc>(create: (context) => AuthBloc( Locator().getIt() ),),
  ], 

  child: child
);