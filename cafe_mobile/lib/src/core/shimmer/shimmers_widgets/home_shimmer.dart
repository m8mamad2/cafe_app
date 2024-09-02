import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Widget homeShimmer(BuildContext context)=> Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Populdar ❤️',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: context.height*0.02,),
          SizedBox(
            height: context.height * 0.29,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
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
                            shimmerWidget(context, Container(height: 17,width:70, color:Colors.white)),
                            const SizedBox(height: 2,),
                            shimmerWidget(context, Container(height: 17,width:context.width*0.3, color:Colors.white)),
                            const SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                shimmerWidget(context, Container(height: 17,width:50, color:Colors.white)),
                                shimmerWidget(
                                  context, 
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                  ),
                                ),
                              ],
                              )
                          ],
                        ),  
                      ),
                    ),
                    shimmerWidget(
                      context,
                      Align(
                        alignment: Alignment.topCenter,
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
              )),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height*0.04),
          Text('Special For You 🔥',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: context.height*0.02,),
          SizedBox(
            width: double.infinity,
            height: context.height*0.6,
            child: ListView.builder(
              itemCount: 7,
              physics: const NeverScrollableScrollPhysics(),
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
                                  Container(
                                    margin: const EdgeInsets.only(left: 0),
                                    child: shimmerWidget(context, Container(height: 17,width:40, color:Colors.white))),
                                  shimmerWidget(
                                    context, 
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 17),
                                        alignment: Alignment.center,
                                        width: context.width * 0.3,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).dialogBackgroundColor,
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Text('Add To Card +', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10),),
                                      ),
                                    ),
                                  ),
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
              )),
          ),
        ],
      ),
      SizedBox(height: context.height*0.13,),
    ],
  );