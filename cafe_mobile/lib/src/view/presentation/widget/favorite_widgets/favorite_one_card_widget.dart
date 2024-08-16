
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/data/model/favorite_model.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/page/details_food_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget favoriteOneCardWidget(BuildContext context, FavoriteModel favoriteModel) => InkWell(
  onTap: () => context.navigate(DetailsFoodScreen(data: FoodModel.fromFavoriteModel(favoriteModel))),
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
              Image.network( context.convertImageUrl(favoriteModel.images![0]) ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    favoriteModel.title?.substring(0,15) ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    favoriteModel.description?.substring(0,15) ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Colors.white60),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${favoriteModel.price}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          print('_______--)');
                          context.read<FavoriteBloc>().add(DeleteFavoriteEvent(favoriteModel.id!));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.delete_outline, color: Colors.black,),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
);
