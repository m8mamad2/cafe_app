import 'dart:io';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/utils/get_token.dart';
import 'package:cafe_mobile/src/view/presentation/page/auth_screen.dart';
import 'package:cafe_mobile/src/view/presentation/page/main_screen.dart';
import 'package:flutter/material.dart';

  
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Expanded(
            flex: 6,
            // child: RiveAnimation.asset('assets/foodie.riv')),
            child: Container()),
          Expanded(
            child: FutureBuilder(
              future: internetAndAuthChecker(context),
              builder: (context, snapshot) {
                return switch(snapshot.connectionState){
                  ConnectionState.none => const CircularProgressIndicator(),
                  ConnectionState.waiting => const CircularProgressIndicator(),
                  _ => const SizedBox()
                };
              },
            ))
        ],
      ),
    );


  }

  Future<bool> internetAndAuthChecker(BuildContext context)async{
      bool? hasInternet;
      final result = await InternetAddress.lookup('google.com');
      hasInternet =  result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      if(hasInternet){
        String? isAuth = await GetToken.getToken();
        // ignore: use_build_context_synchronously
        await Future.delayed(const Duration(seconds: 2),()=> context.navigateReplacement(isAuth != null ? const MainScreen() : const AuthScreen()));
        return true;
      }
      else return false;
    }

}

