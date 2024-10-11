import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmers_widgets/cart_shimmer.dart';
import 'package:cafe_mobile/src/core/widgets/empty_widget.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/widget/cart_widget/cart_checkout_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/cart_widgets/cart_one_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetAllCartsEvent());
    context.read<UserBloc>().add(CurrentUserEvent(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            
                Container(
                  margin: EdgeInsets.only(top: context.height * 0.06,bottom: context.height * 0.02),
                  child: Text(
                    'Your Cart 🛒',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28),
                  )),
            
                Container(
                  margin: const EdgeInsets.only(bottom: 13),
                  child: IconButton(
                    onPressed: ()=> context.read<CartBloc>().add(ClearCartModel()), 
                    icon: const Icon(Icons.delete_outline, color: Colors.white,size: 32,)),
                ),
            
              ],
            ),
          ),
          
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if(state is LoadingCartState)return cartShimmer(context);
                if(state is SuccessCartState){
                  final data = state.cartModels;
                  return data != null && data.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.length,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) => cartOneCardWidget(context, data[index]),
                      )
                    : emptyWidget(context, (){}, false, "The Cart is Empty :)", false);
                }
                if(state is FailCartState)return Expanded(child: emptyWidget(context, (){}, true, state.error ));
                return Container();
              },
            ),
          ),
          
          cartCheckoutWidget(context),
          
        ],
      ),
    );
  }
}
