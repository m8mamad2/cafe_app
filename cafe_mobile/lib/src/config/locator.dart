import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/core/data_source/remote/api_configure.dart';
import 'package:cafe_mobile/src/view/data/repo/auth_repo_impl.dart';
import 'package:cafe_mobile/src/view/domain/repo/auth_repo.dart';
import 'package:cafe_mobile/src/view/domain/use_case/auth_usecase.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

class Locator{

  final getIt = GetIt.instance;

  setUp(){

    getIt.registerSingleton<Api>(Api());
    getIt.registerSingleton<LocalDb>(LocalDb());

    getIt.registerSingleton<AuthRepo>(AuthRepoImpl( getIt() ));
    getIt.registerSingleton<AuthUseCase>(AuthUseCase( getIt() ));
    getIt.registerSingleton<AuthBloc>(AuthBloc( getIt() ));

    
  }

}