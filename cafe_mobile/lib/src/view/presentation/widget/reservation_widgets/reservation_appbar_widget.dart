import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

Widget reservationAppbarWidget(BuildContext context)=>Container(
  margin: EdgeInsets.only(
    top: context.height * 0.06,
    left: 15
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Icon(Icons.arrow_back, color:Colors.white),
      const SizedBox(height: 20,),
      Text('Reserve A Table',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white30,fontSize: 14),),
      Text('Foodie Tables',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),)
    ],
  ),
);