import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

Widget authSubmitWidget(BuildContext context,VoidCallback onPress, bool isLoading)=> Padding(
  padding: const EdgeInsets.only(bottom: 45),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      minimumSize: Size(context.width, context.height*0.055),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      )
    ),
    onPressed: onPress, 
    child: isLoading
      ? CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor,)
      : Text( 'submit', style: Theme.of(context).textTheme.titleLarge,)),
);