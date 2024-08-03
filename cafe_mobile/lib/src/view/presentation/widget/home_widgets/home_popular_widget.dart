import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

Widget homePopularWidget(BuildContext context)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Populdar ❤️',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
    SizedBox(height: context.height*0.02,),
    SizedBox(
      height: context.height * 0.29,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => popularOneCardWidget(context),),
    )
  ],
);



Widget popularOneCardWidget(BuildContext context)=> Container(
  width: context.width * 0.38,
  margin: const EdgeInsets.symmetric(horizontal: 5),
  child: Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: context.height*0.25,
          padding: const EdgeInsets.only(left: 10,right: 10, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Pitzaaa 1',style: TextStyle(color: Colors.white,fontSize: 14),),
              Text('Peperon one',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white60),),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$295',style: Theme.of(context).textTheme.labelLarge,),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Icon(Icons.add),
                  )
                ],
                )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset('assets/food.png',)),
    ],
  ),
  
);