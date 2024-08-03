import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget homeAppbarWidget(BuildContext context){
  return AppBar(
    actions: [
      Text("👋  Hi Mamady",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
      const SizedBox(width: 10,),
    ],
    leadingWidth: context.width * 0.15,
    toolbarHeight: context.height * 0.1,
    leading: Container(
      margin: const EdgeInsets.only(left: 10,top: 15,bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(10),
      child: const Icon(Icons.person),
    ),
  );
}