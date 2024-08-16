import 'package:cafe_mobile/src/core/constans/value_notifier.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_one_chair_widget.dart';
import 'package:flutter/material.dart';


Widget reservationOneTableWidget(BuildContext context, int angle, int chairsNumber , int index, bool isSelected, bool isReserved){
  return RotatedBox(
    quarterTurns: angle,
    child: InkWell(
      onTap: ()=> !isReserved ? selectedTable.value = index : print('Reserved'),
      child: Container(
        margin: const EdgeInsets.all(2),
        height: context.height*0.28,
        alignment: Alignment.center,
        child: Stack(
          children: [
      
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: List.generate(chairsNumber, (index) => oneChairWidget(context, chairsNumber, isSelected, isReserved),)
              ),
            ),
      
            Container(
              margin: EdgeInsets.only(top: context.height*0.12),
              child: Row(
                children: List.generate(chairsNumber, (index) => oneChairWidget(context, chairsNumber, isSelected, isReserved),),
              ),
            ),
            
            Container(
              width: chairsNumber == 2 ? context.width*0.3 : context.width*0.38,
              height: context.height*0.09,
              margin: EdgeInsets.only(top: context.height *0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all( color: isSelected || isReserved ? Theme.of(context).primaryColor :Colors.white ),
                color: isSelected || isReserved ? Theme.of(context).primaryColor.withOpacity(0.8) : Colors.white70
              ),
            ),
            
            // Container(
            //   margin: EdgeInsets.only(left: context.width*0.174, top: context.height*0.074),
            //   width: 20,
            //   height: 20,
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(color: Theme.of(context).primaryColor),
            //     color: Theme.of(context).primaryColor,
            //   ),
            //   child: Text(index.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 13),),
            // )
        
          ],
        ),
      ),
    ),
  );
}
