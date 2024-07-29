import 'package:flutter/material.dart';

PreferredSizeWidget homeAppbarWidget(BuildContext context){
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    actions: [
      Container(
        child: Text('👋'),
      ),
      Text("Hi Mamady ",style: Theme.of(context).textTheme.titleSmall,),
    ],

    leading: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(10),
      child: Icon(Icons.person),
    ),
  );
}