import 'package:cafe_mobile/src/core/constans/value_notifier.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:cafe_mobile/src/view/data/model/favorite_model.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsFoodAddButtonWidget extends StatelessWidget {
  final FoodModel foodModel;
  const DetailsFoodAddButtonWidget({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state is LoadingCartState) return const CircularProgressIndicator();
          if(state is SuccessCartState){
            
            final data = state.cartModels;
            final oneCartModel = data != null && data.isNotEmpty  
              ? data.where((cartModel)=> cartModel.id == foodModel.id).toList()
              : null;
            final oneCartData = oneCartModel != null && oneCartModel.isNotEmpty ? oneCartModel[0] : null;
            final isExistInCart = data != null && data.any((element) => element.id == foodModel.id,);

            
            return Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 50,
                      child: isExistInCart 
                        ? ElevatedButton(
                          onPressed: (){
                            bottomNavigationIndex.value = 3;
                            context.navigateBack();
                          }, 
                          style: addBottomStyle(context),
                          child: Text("See Cart",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),))
                        : ElevatedButton(
                            onPressed: ()=> context.read<CartBloc>().add(AddToCartsEvent(CartModel.fromFoodModel(foodModel))), 
                            style: addBottomStyle(context),
                            child: Text('Add To Cart ', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),)),
                    ),
                  ),
                    
                  const SizedBox(width: 5,),
                  
                  isExistInCart 
                    ? Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
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
                                  child: InkWell(
                                    onTap:()=> oneCartData != null ? context.read<CartBloc>().add(IncCartEvent(oneCartData.localId, true)) : null,
                                    child: const Icon(Icons.add, color: Colors.white)),
                                ),
                  
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(oneCartData != null ? oneCartData.howMuch.toString() : '0', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).scaffoldBackgroundColor),)),
                    
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    border: Border.all( width: 0.1, color: Colors.white ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: InkWell(
                                    onTap:()=> oneCartData != null 
                                      ? oneCartData.howMuch <= 1 
                                        ? context.read<CartBloc>().add(DeleteFromCartsEvent(oneCartData.id!))
                                        : context.read<CartBloc>().add(IncCartEvent(oneCartData.localId, false))
                                      : null,
                                    child: const Icon(Icons.remove, color: Colors.white)),
                                ),
                                
                              ],
                            ),
                        ),)
                    : Expanded(
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: BlocBuilder<FavoriteBloc, FavoriteState>(
                              builder:(context, state) {
                                if(state is LoadingFavoriteState) return const CircularProgressIndicator();
                                if(state is SuccessFavoriteState){
                                  final data = state.favoriteData;
                                  return data != null && data.any((element) => element.id == foodModel.id,)
                                    ? IconButton(
                                        onPressed: ()=> context.read<FavoriteBloc>().add(DeleteFavoriteEvent(foodModel.id!)), 
                                        icon: Icon(Icons.favorite, color: Theme.of(context).primaryColor,size: 33,))
                                    : IconButton(
                                      onPressed: ()=>context.read<FavoriteBloc>().add(AddFavoriteEvent(FavoriteModel.fromFoodModel(foodModel))), 
                                      icon: Icon(Icons.favorite_outline, color: Theme.of(context).primaryColor,size: 33));
                                };
                                if(state is FailFavoriteState) return Text(state.error.toString());
                                return Container();
                              } ,
                            ),
                          ),
                      )
                    
                ],
              ),
            );
          }
          if(state is FailCartState) return Text(state.error, style: TextStyle(color: Colors.white),);
          return Container();
        },
      );
  }
}



addBottomStyle(BuildContext context)=>ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).cardColor,
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10)
    )
  );

productActionStyle(BuildContext context)=>ElevatedButton.styleFrom(
  minimumSize: const Size(40, 30),
  maximumSize: const Size(40, 30),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  backgroundColor: Theme.of(context).primaryColor,
);
