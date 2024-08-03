import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

class DetailsFoodScreen extends StatefulWidget {
  const DetailsFoodScreen({super.key});

  @override
  State<DetailsFoodScreen> createState() => _DetailsFoodScreenState();
}
class _DetailsFoodScreenState extends State<DetailsFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                  Container(
                    width: context.width,
                    height: context.height*0.35 ,
                    padding: const EdgeInsets.all(15),
                    decoration:  BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(color: Theme.of(context).primaryColor)
                      ),
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(1000), bottomRight: Radius.circular(1000), )),
                    child: Center(
                      child: Container(
                        decoration:  const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 2 ),
                              blurRadius: 10,
                              spreadRadius: 0.1,
                            )
                          ]
                        ),
                        child: Image.asset('assets/food.png', )),
                    ),),
                  Container(
                    margin: EdgeInsets.only(top: context.height*0.32),
                    width: context.width*0.26,
                    height: context.height*0.12,
                    decoration:  BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.5)),
                      shape: BoxShape.circle
                    ),
                    child: Image.asset('assets/food.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: context.height*0.38,left: context.width*0.36),
                    width: context.width*0.26,
                    height: context.height*0.12,
                    decoration:  BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.5)),
                      shape: BoxShape.circle
                    ),
                    child: Image.asset('assets/food.png'),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(top: context.height*0.32),
                      width: context.width*0.26,
                      height: context.height*0.12,
                      decoration:  BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.5)),
                        shape: BoxShape.circle
                      ),
                      child: Image.asset('assets/food.png'),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: context.height*0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('First Pitza PEPEROny 🔥',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 21)),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: '\$ ', style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).primaryColor,fontSize: 24)),
                              TextSpan(text: '200', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 24)),
                            ]
                        ))
                      ],
                    ),
                    SizedBox(height: context.height*0.02,),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea ⭐',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey),),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        children: [
                      
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).cardColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                                child: Text('Add To Cart  🛒', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),)),
                            ),
                          ),
                            
                          const SizedBox(width: 5,),
                          
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                      
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      border: Border.all( width: 0.1, color: Colors.white ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: const Icon(Icons.add, color: Colors.white),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text('2', style: Theme.of(context).textTheme.titleSmall,)),
                      
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      border: Border.all( width: 0.1, color: Colors.white ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: const Icon(Icons.remove, color: Colors.white),
                                  ),
                                  
                                ],
                              ),
                            ),
                          )
                          
                        ],
                      ),
                    ),
                  ],
                ),),
            )
          ],
        )
      ),
    );
  }
}

productActionStyle(BuildContext context)=>ElevatedButton.styleFrom(
  minimumSize: const Size(40, 30),
  maximumSize: const Size(40, 30),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  backgroundColor: Theme.of(context).primaryColor,
);