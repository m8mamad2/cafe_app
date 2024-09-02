import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Widget cartShimmer(BuildContext context)=>ListView.builder(
    itemCount: 4,
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
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
              
                          shimmerWidget(
                            context,
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                border: Border.all( width: 1, color: Theme.of(context).primaryColor ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: InkWell(
                                child: const Icon(Icons.remove, color: Colors.white)),
                            ),
                          ),
            
                          shimmerWidget(
                            context,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(color: Colors.white,)),
                          ),
              
                          shimmerWidget(
                            context,
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                border: Border.all( width: 1, color: Theme.of(context).primaryColor ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: InkWell(
                                child: const Icon(Icons.remove, color: Colors.white)),
                            ),
                          ),
                          
                        ],
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
  ),
  );

Widget cartBottomShimmer(BuildContext context)=> Column(
    children: [
      SizedBox(height: context.height*0.03,),
      
      shimmerWidget(
        context, 
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10 ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration:  const BoxDecoration(
            color: Colors.white,
            border: Border.symmetric( horizontal: BorderSide(color: Colors.white12, width: 1) )
          ),),
      ),
      shimmerWidget(
        context, 
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10 ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration:  const BoxDecoration(
            color: Colors.white,
            border: Border.symmetric( horizontal: BorderSide(color: Colors.white12, width: 1) )
          ),),
      ),
      shimmerWidget(
        context, 
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10 ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration:  const BoxDecoration(
            color: Colors.white,
            border: Border.symmetric( horizontal: BorderSide(color: Colors.white12, width: 1) )
          ),),
      ),
      
      
      SizedBox(height: context.height*0.03,),
      shimmerWidget(
        context,
        ElevatedButton(
          onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            minimumSize: Size(double.infinity, context.height*0.06),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: Text('Ceck out', style: Theme.of(context).textTheme.bodyLarge,)),
      )
    ],
  );