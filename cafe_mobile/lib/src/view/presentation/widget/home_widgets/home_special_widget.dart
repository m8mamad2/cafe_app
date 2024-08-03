import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

Widget homeSpecialWidget(BuildContext context)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: context.height*0.04),
    Text('Special For You 🔥',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
    SizedBox(height: context.height*0.02,),
    SizedBox(
      width: double.infinity,
      height: context.height*0.6,
      child: ListView.builder(
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => specialOneCardWidget(context),),
    )
  ],
);




Widget specialOneCardWidget(BuildContext context)=> SizedBox(
  width: double.infinity,
  height: context.height*0.15,
  child: Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: context.width*0.85,
            padding: const EdgeInsets.only(top: 8,bottom: 8,right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          const Text('Pitzaaa 1',style: TextStyle(color: Colors.white,fontSize: 14),),
                          Text('Peperon one',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white60),),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 30),
                            child: Text('\$295',style: Theme.of(context).textTheme.labelLarge,)),
                        ],
                      ),
                    ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 17),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text('Add To Card +', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      
      Container(
        margin: const EdgeInsets.only(top: 5),
        width: context.width*0.3,
        child: Image.asset('assets/food.png',))
    ],
  ),
);