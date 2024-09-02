import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

Widget emptyWidget(BuildContext context, VoidCallback onTap,bool isError, [String? error,bool? needPadding])=>Center(
  child: Container(
    padding: needPadding ?? true ? EdgeInsets.only(bottom: context.height * 0.13) : EdgeInsets.zero ,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset('assets/lottie/empty.json'),
        Text(error ?? "Theme is a Proble", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        const SizedBox(height: 30,),
        isError 
          ? ElevatedButton(
            onPressed: onTap, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              minimumSize: Size(context.width*0.6, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ),
            child: const Text('Try again ..!', style: TextStyle(color: Colors.white),))
          : const SizedBox.shrink()
      ],
    ),
  ),
);