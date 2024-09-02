import 'package:cafe_mobile/src/config/locator.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/food_bloc/food_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/reservation_bloc/reservation_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

blocProviders(Widget child)=> MultiBlocProvider(
  
  providers: [
    BlocProvider<AuthBloc>(create: (context) => AuthBloc( Locator().getIt() ),),
    BlocProvider<FoodBloc>(create: (context) => FoodBloc( Locator().getIt() ),),
    BlocProvider<FavoriteBloc>(create: (context) => FavoriteBloc( Locator().getIt() ),),
    BlocProvider<CartBloc>(create: (context) => CartBloc( Locator().getIt() ),),
    BlocProvider<UserBloc>(create: (context) => UserBloc( Locator().getIt(), Locator().getIt() ),),
    BlocProvider<ReservationBloc>(create: (context) => ReservationBloc( Locator().getIt() ),),
    BlocProvider<OrderBloc>(create: (context) => OrderBloc( Locator().getIt() ),),
  ], 

  child: child
);