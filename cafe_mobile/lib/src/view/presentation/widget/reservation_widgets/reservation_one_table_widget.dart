import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_one_chair_widget.dart';
import 'package:flutter/material.dart';


Widget reservationOneTableWidget(BuildContext context, double angle, int chairsNumber){
  return Transform.rotate(
    angle: angle,
    child: Container(
      margin: const EdgeInsets.all(2),
      height: context.height*0.28,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Stack(
        children: [
    
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: List.generate(chairsNumber, (index) => oneChairWidget(context, chairsNumber),)
            ),
          ),
    
          Container(
            margin: EdgeInsets.only(top: context.height*0.12),
            child: Row(
              children: List.generate(chairsNumber, (index) => oneChairWidget(context, chairsNumber),),
            ),
          ),
          
          Container(
            width: chairsNumber == 2 ? context.width*0.3 : context.width*0.38,
            height: context.height*0.09,
            margin: EdgeInsets.only(top: context.height *0.04),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all( color: Colors.white ),
              color: Colors.white70
            ),
          ),
          
        ],
      ),
    ),
  );
}
