import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsExistInCartWidget extends StatefulWidget {
  final FoodModel foodModel;
  final Widget isExistWidget;
  final Widget notExistWidget;
  const IsExistInCartWidget({super.key, required this.foodModel, required this.isExistWidget, required this.notExistWidget});

  @override
  State<IsExistInCartWidget> createState() => _IsExistInCartWidgetState();
}
class _IsExistInCartWidgetState extends State<IsExistInCartWidget> {

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if(state is LoadingCartState) return const CircularProgressIndicator();
        if(state is SuccessCartState){
          final data = state.cartModels;
          return data != null && data.any((element) => element.id == widget.foodModel.id )
            ? InkWell(
                onTap: () => context.read<CartBloc>().add(DeleteFromCartsEvent(widget.foodModel.id ?? 0)),
                child: widget.notExistWidget, )
            : InkWell(
                onTap: () => context.read<CartBloc>().add(AddToCartsEvent(CartModel.fromFoodModel(widget.foodModel))),
                child: widget.isExistWidget, ) ;
        }
        if(state is FailCartState) {
          print('Ero is -> ${state.error}');
          return  Container(width: 10,height: 10,color: Colors.red,);
        }
        return Container();
      },);
  }
}