import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/widgets/is_exist_in_cart_widget.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/presentation/page/details_food_screen.dart';
import 'package:flutter/material.dart';

Widget homePopularWidget(BuildContext context, List<FoodModel> foodModels)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Populdar ❤️',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
    SizedBox(height: context.height*0.02,),
    SizedBox(
      height: context.height * 0.29,
      width: double.infinity,
      child: ListView.builder(
        itemCount: foodModels.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => popularOneCardWidget(context, foodModels[index]),),
    )
  ],
);



Widget popularOneCardWidget(BuildContext context, FoodModel foodModle)=> InkWell(
  onTap: () => context.navigate(DetailsFoodScreen(data: foodModle)),
  child: Container(
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
                Text(foodModle.title?.substring(0,9) ?? '',style: const TextStyle(color: Colors.white,fontSize: 14),),
                Text(foodModle.description?.substring(0, 20) ?? '',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white60),),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${foodModle.price}',style: Theme.of(context).textTheme.labelLarge,),
                    IsExistInCartWidget(
                      foodModel: foodModle,
                      isExistWidget: existWidget(context),
                      notExistWidget: notExistWidget(context),),
                  ],
                  )
              ],
            ),  
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network( context.convertImageUrl(foodModle.images![0]))),
      ],
    ),
  ),
);


Widget existWidget(BuildContext context)=> Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
    ),
    padding: const EdgeInsets.all(4),
    child: const Icon(Icons.add),
  );
Widget notExistWidget(BuildContext context)=> Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
    ),
    padding: const EdgeInsets.all(4),
    child: const Icon(Icons.close),
  );

