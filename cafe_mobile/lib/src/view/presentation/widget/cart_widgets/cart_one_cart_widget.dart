

import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/page/details_food_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget cartOneCardWidget(BuildContext context, CartModel cartModel)=> InkWell(
  onTap: ()=> context.navigate(DetailsFoodScreen(data: FoodModel.fromCartModel(cartModel),)),
  child: SizedBox(
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
                        Text(cartModel.title?.substring(0,15) ?? '',style: const TextStyle(color: Colors.white,fontSize: 14),),
                        Text(cartModel.description?.substring(0,28) ?? '',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white60),),]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Container(
                        margin: const EdgeInsets.only(right: 35),
                        child: Text('\$${cartModel.price}',style: Theme.of(context).textTheme.labelLarge,)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
              
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all( width: 1, color: Theme.of(context).primaryColor ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: InkWell(
                              onTap:()=> context.read<CartBloc>().add(IncCartEvent(cartModel.localId, true)) ,
                              child: const Icon(Icons.add, color: Colors.white)),
                          ),
            
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(cartModel.howMuch.toString(), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),)),
              
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all( width: 1, color: Theme.of(context).primaryColor ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: InkWell(
                              onTap:()=> context.read<CartBloc>().add(IncCartEvent(cartModel.localId, false)) ,
                              child: const Icon(Icons.remove, color: Colors.white)),
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
        
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: context.width*0.3,
          child: Image.network( context.convertImageUrl(cartModel.images![0])))
      ],
    ),
  ),
);