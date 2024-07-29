
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

Widget tabBarButton(BuildContext context ,String title,bool isActive,VoidCallback onPress )=> InkWell(
  onTap: onPress,
  child: Container(
    alignment: Alignment.bottomCenter,
    width: context.width*0.25,
    padding: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(color: isActive ? Colors.orange : Colors.transparent,width: 4))
    ),
    child: Text(title, style: Theme.of(context).textTheme.titleLarge,)),
);