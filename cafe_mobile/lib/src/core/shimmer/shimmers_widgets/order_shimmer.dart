import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';
import '../shimmer.dart';

Widget orderShimmer(BuildContext context)=>ListView.builder(
  itemCount: 2,
  padding: const EdgeInsets.symmetric(horizontal: 10),
  itemBuilder: (context, index) => SizedBox(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        shimmerWidget(context, Container(height: 17,width:context.width*0.25, color:Colors.white)),
                        const SizedBox(height: 5,),
                        shimmerWidget(context, Container(height: 17,width:context.width*0.35, color:Colors.white)),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      shimmerWidget(context, Container(
                        width: 40,
                        height: 15,
                        color:Colors.white,
                        margin: const EdgeInsets.only(right: 5),),),
                      
                      shimmerWidget(
                        context,
                        Container(
                          width: context.width*0.3,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(3)
                          ),
                        
                        ),
                      )
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        
        shimmerWidget(
          context,
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: context.width*0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container()),
            ),
          ),
        ),
      ],
    ),
  )
);

