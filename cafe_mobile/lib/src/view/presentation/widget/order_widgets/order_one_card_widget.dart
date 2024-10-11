

import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/data/model/order_model.dart';
import 'package:cafe_mobile/src/view/presentation/page/details_food_screen.dart';
import 'package:flutter/material.dart';

Widget orderOneCardWidget(BuildContext context, OrderModel orderModel)=> InkWell(
  onTap: ()=> context.navigate(DetailsFoodScreen(data: FoodModel.fromOrderModel(orderModel),)),
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
                        Text(orderModel.title?.substring(0,9) ?? '',style: const TextStyle(color: Colors.white,fontSize: 14),),
                        Text(orderModel.description?.substring(0,28) ?? '',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white60),),]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Container(
                        margin: const EdgeInsets.only(right: 35),
                        child: Text('\$${orderModel.price}',style: Theme.of(context).textTheme.labelLarge,)),
                      Container(
                        width: context.width*0.3,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: Text('arriving',style: Theme.of(context).textTheme.labelSmall),
                      )
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
          child: Image.network( context.convertImageUrl(orderModel.images![0])))
      ],
    ),
  ),
);