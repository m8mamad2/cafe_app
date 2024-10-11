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

Future successDialog(BuildContext context, String title)async=>
  await showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,style: TextStyle(color:Colors.white),),
          SizedBox(height: 10,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              backgroundColor: Theme.of(context).primaryColor
            ),
            onPressed: ()=> context.navigateBack(), 
            child: Text('ok', style: TextStyle(color: Colors.white),))
        ],
      ),
    ),);
