
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';


Widget reservationBackgroundsWidget(BuildContext context, ScrollController scrollController){
  return Transform.rotate(
    angle: -0.0,
    child: Stack(
      children: [
        SizedBox(
          height: context.height,
          width: context.width,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => 
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                height: 1,
                width: context.width,
                color:Colors.white12
              ),),
        ),
        SizedBox(
          height: context.height,
          width: context.width,
          child: RotatedBox(
            quarterTurns: 1,
            child: ListView.builder(
              itemCount: 20,
              controller: scrollController,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => 
                Container(
                  margin: const EdgeInsets.symmetric(vertical:
                   30),
                  height: 1,
                  width: context.width,
                  color:Colors.white12
                ),),
          ),
        ),
      ],
    ),
  );
}