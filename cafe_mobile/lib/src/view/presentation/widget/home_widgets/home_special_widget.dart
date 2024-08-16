import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/widgets/is_exist_in_cart_widget.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/presentation/page/details_food_screen.dart';
import 'package:flutter/material.dart';

Widget homeSpecialWidget(BuildContext context, List<FoodModel> foodModels)=>Column(
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
        itemBuilder: (context, index) => specialOneCardWidget(context, foodModels[index]),),
    ),
  ],
);




Widget specialOneCardWidget(BuildContext context, FoodModel foodModel)=> InkWell(
  onTap: () => context.navigate(DetailsFoodScreen(data: foodModel)),
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
                        Text(foodModel.title?.substring(0,9) ?? '',style: const TextStyle(color: Colors.white,fontSize: 14),),
                        Text(foodModel.description?.substring(0,28) ?? '',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white60),),]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Container(
                        margin: const EdgeInsets.only(right: 35),
                        child: Text('\$${foodModel.price}',style: Theme.of(context).textTheme.labelLarge,)),
                      IsExistInCartWidget(
                        foodModel: foodModel, 
                        isExistWidget: existInCart(context), 
                        notExistWidget: notExistInCart(context))
                      
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
          child: Image.network( 
            context.convertImageUrl(foodModel.images![0]), fit: BoxFit.cover,))
      ],
    ),
  ),
);


Widget existInCart(BuildContext context)=> Align(
  alignment: Alignment.bottomRight,
  child: Container(
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 17),
    alignment: Alignment.center,
    width: context.width * 0.3,
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5)
    ),
    child: Text('Add To Card +', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10),),
  ),
);

Widget notExistInCart(BuildContext context)=> Align(
  alignment: Alignment.bottomRight,
  child: Container(
    alignment: Alignment.center,
    width: context.width * 0.3,
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 17),
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Theme.of(context).primaryColor),
    ),
    child: Text('Delete From Cart', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10),),
  ),
);