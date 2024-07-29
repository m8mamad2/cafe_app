import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

Future errorDialog(BuildContext context, String title)async=>
  await showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      content: Column(
        children: [
          Text(title),
          ElevatedButton(onPressed: ()=> context.navigateBack(), child: Text('ok'))
        ],
      ),
    ),);