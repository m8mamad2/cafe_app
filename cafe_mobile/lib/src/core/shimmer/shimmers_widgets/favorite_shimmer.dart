import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Widget favoriteShimmer(BuildContext context)=>GridView.builder(
  itemCount: 12,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
          crossAxisCount: 2),
  itemBuilder: (context, index) {
    double topPadding = index % 2 == 0 ? 10.0 : 20.0;
    double bottomPadding = index % 3 == 0 ? 20 : 10.0; 
    return Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
        child: Container(
        width: context.width * 0.38,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerWidget(
                context,
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: context.width*0.18,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container()),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shimmerWidget(context, Container(height: 17,width:context.width*0.25, color:Colors.white)),
                  const SizedBox(height: 5,),
                  shimmerWidget(context, Container(height: 17,width:context.width*0.35, color:Colors.white)),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shimmerWidget(context, Container(height: 17,width:context.width*0.1, color:Colors.white)),
                      shimmerWidget(
                        context,
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.delete_outline, color: Colors.black,),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ));
  });