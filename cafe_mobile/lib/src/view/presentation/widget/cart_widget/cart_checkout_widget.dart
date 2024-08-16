
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Widget cartCheckoutWidget(BuildContext context)=> Container(
      height: context.height*0.4,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, ),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if(state is LoadingCartState)return const CircularProgressIndicator();
            if(state is SuccessCartState){

              final data = state.cartModels;
              double total = data != null && data.isNotEmpty ?  
                data.map((item) => item.howMuch.toDouble() * item.price!.toDouble()).reduce((value1, value2) => value1 + value2)
                : 0;
              
              return Column(
                children: [
                  SizedBox(height: context.height*0.03,),
                  
                  oneItemOfPaymentDescription(context, "Sub Total","\$$total",false),
                  oneItemOfPaymentDescription(context, "Delivery","\$2.00",true),
                  oneItemOfPaymentDescription(context, "Total","\$${total+2.0}",false),
                  
                  SizedBox(height: context.height*0.03,),
                  ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(double.infinity, context.height*0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text('Ceck out', style: Theme.of(context).textTheme.bodyLarge,))
                ],
              );
            }
            if(state is FailCartState)return Text(state.error);
            return Container();
          },
        ),
      ),
    );
  

Widget oneItemOfPaymentDescription(BuildContext context, String title, String price, bool isCenter)=>Container(
  padding: EdgeInsets.symmetric(vertical: isCenter ? 10 : 0),
  margin: const EdgeInsets.symmetric(vertical: 8),
  decoration:  BoxDecoration(
    border: isCenter 
      ? const Border.symmetric( horizontal: BorderSide(color: Colors.white12, width: 1) )
      : null
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
      Text(price, style: Theme.of(context).textTheme.labelLarge,),
    ],
  ),
);