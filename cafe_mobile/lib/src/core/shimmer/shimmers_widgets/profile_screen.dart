import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

profileShimmer (BuildContext context)=> Column(
              children: [
                SizedBox(
                  height: context.height * 0.45,
                  child: Stack(
                    children: [
                      Container(
                        height: context.height * 0.3,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          image: const DecorationImage(
                              image: AssetImage( 'assets/profile_bg.jpg', ),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            shimmerWidget(
                              context, 
                              Container(
                                margin: const EdgeInsets.only(top: 40),
                                decoration:const BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle
                                ),
                                child: CircleAvatar(backgroundColor: Colors.white,radius: context.width*0.18,))),
                            shimmerWidget(
                              context,
                               Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child:Container(width: context.width*0.2 ,height: 30,color:Colors.white,) ),
                            ),
                            const SizedBox(height: 10,),
                            shimmerWidget(
                              context,Container(width: context.width*0.4 ,height: 30,color:Colors.white,)
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.04,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      oneCart(context),
                      oneCart(context),
                      oneCart(context),
                      oneCart(context),
                    ],
                  ),
                )
              ],
            );



Widget oneCart(BuildContext context)=>shimmerWidget(
  context,
  Container(
    width: double.infinity,
    height: context.height * 0.08,
    decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        shimmerWidget(context,Container(height: 30,width: 50,color:Colors.white,)),
        shimmerWidget(context,Container(height: 30,width: 50,color:Colors.white,)),
      ],
    ),
  ),
);