import 'dart:developer';

import 'package:cafe_mobile/src/core/data_source/local/local_db.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/utils/get_token.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/home_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbarWidget(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Find The Delicious \n Food Around you 🔥",style: Theme.of(context).textTheme.titleLarge,),

            Column(
              children: [
                Text('Populdar 🔥',style: Theme.of(context).textTheme.titleSmall),
                SizedBox(
                  height: context.height * 0.25,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => popularCardWidget(context),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


Widget popularCardWidget(BuildContext context)=> Container(
  color: Colors.orange,
  width: context.width * 0.3,
  child: Stack(
    children: [
      Container(
        color: Colors.red,
        child: Column(
          children: [
            Text('Pitzaaa 1'),
            Text('Peperon one'),
            Row(
                children: [
                  Text('\$295'),
                  Container(
                    child: Icon(Icons.add),
                  )
                ],
              )
          ],
        ),
      ),
      Image.asset('assets/food.png', width: context.width,),
    ],
  ),
  
);