import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/widget/cart_widget/cart_checkout_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/home_special_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => 
                index == 0
                  ? Container(
                      margin: EdgeInsets.only(top: context.height*0.06,bottom: context.height*0.02),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Your Cart 🛒',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28),))
                  : specialOneCardWidget(context),),
          ),

          
          cartCheckoutWidget(context),
        ],
      ),
    );
  }
}
