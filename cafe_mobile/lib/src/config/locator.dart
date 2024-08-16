import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/core/data_source/remote/api_configure.dart';
import 'package:cafe_mobile/src/view/data/repo/auth_repo_impl.dart';
import 'package:cafe_mobile/src/view/data/repo/cart_repo_impl.dart';
import 'package:cafe_mobile/src/view/data/repo/favorite_repo_impl.dart';
import 'package:cafe_mobile/src/view/data/repo/food_repo_impl.dart';
import 'package:cafe_mobile/src/view/data/repo/reservation_repo_impl.dart';
import 'package:cafe_mobile/src/view/domain/repo/auth_repo.dart';
import 'package:cafe_mobile/src/view/domain/repo/cart_repo.dart';
import 'package:cafe_mobile/src/view/domain/repo/favorite_repo.dart';
import 'package:cafe_mobile/src/view/domain/repo/food_repo.dart';
import 'package:cafe_mobile/src/view/domain/repo/reservation_repo.dart';
import 'package:cafe_mobile/src/view/domain/use_case/auth_usecase.dart';
import 'package:cafe_mobile/src/view/domain/use_case/cart_usecase.dart';
import 'package:cafe_mobile/src/view/domain/use_case/favorite_usecase.dart';
import 'package:cafe_mobile/src/view/domain/use_case/food_usecase.dart';
import 'package:cafe_mobile/src/view/domain/use_case/reservation_usecase.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/food_bloc/food_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/reservation_bloc/reservation_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

class Locator{

  final getIt = GetIt.instance;

  setUp(){

    getIt.registerSingleton<Api>(Api());
    getIt.registerSingleton<LocalDb>(LocalDb());

    getIt.registerSingleton<AuthRepo>(AuthRepoImpl( getIt() ));
    getIt.registerSingleton<AuthUseCase>(AuthUseCase( getIt() ));
    getIt.registerSingleton<AuthBloc>(AuthBloc( getIt() ));
    getIt.registerSingleton<UserBloc>(UserBloc( getIt() ));

    getIt.registerSingleton<FoodRepo>(FoodRepoImpl( getIt() ));
    getIt.registerSingleton<FoodUsecase>(FoodUsecase( getIt() ));
    getIt.registerSingleton<FoodBloc>(FoodBloc( getIt() ));

    getIt.registerSingleton<FavoriteRepo>(FavoriteRepoImpl( ));
    getIt.registerSingleton<FavoriteUsecase>(FavoriteUsecase( getIt() ));
    getIt.registerSingleton<FavoriteBloc>(FavoriteBloc( getIt() ));

    getIt.registerSingleton<CartRepo>(CartRepoImpl( ));
    getIt.registerSingleton<CartUsecase>(CartUsecase( getIt() ));
    getIt.registerSingleton<CartBloc>(CartBloc( getIt() ));

    getIt.registerSingleton<ReservationRepo>(ReservationRepoImpl( getIt() ));
    getIt.registerSingleton<ReservationUsecase>(ReservationUsecase( getIt() ));
    getIt.registerSingleton<ReservationBloc>(ReservationBloc( getIt() ));
    
    
  }

}