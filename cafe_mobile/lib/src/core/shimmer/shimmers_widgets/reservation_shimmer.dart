import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';
import '../shimmer.dart';

Widget reservationShimmer(BuildContext context)=> shimmerWidget(
  context,
  Container(
    height: context.height*0.75,  
    padding: EdgeInsets.only(top: context.height *0.1),
    color: Colors.white54 ,
  ),
);

Widget reservationSchudelShimmer(BuildContext context)=>  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.height*0.25,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Schedule a Visit', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 22),),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Theme.of(context).primaryColor)
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4),
                      child: shimmerWidget(context,Container(color: Colors.white,))
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Theme.of(context).primaryColor)
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4),
                      child: shimmerWidget(context, Container(color: Colors.white,))
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: context.width,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor
              ),
              alignment: Alignment.center,
              child: Container(color: Colors.white,),
            ),
          ],
        ),
      ),
    );