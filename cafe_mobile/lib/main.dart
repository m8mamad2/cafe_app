import 'dart:async';

import 'package:cafe_mobile/src/config/locator.dart';
import 'package:cafe_mobile/src/config/theme.dart';
import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/core/utils/bloc_providers.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/local/user_model.dart';
import 'package:cafe_mobile/src/view/presentation/page/splash_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Locator().setUp();

  await LocalDb.initDatabase();
  
  runApp( blocProviders( const MyApp() ) );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: x(context),
    );
  }
}

