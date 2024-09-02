import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmers_widgets/order_shimmer.dart';
import 'package:cafe_mobile/src/core/widgets/empty_widget.dart';
import 'package:cafe_mobile/src/view/data/model/order_model.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/page/chat_screen.dart';
import 'package:cafe_mobile/src/view/presentation/page/deliver_screen.dart';
import 'package:cafe_mobile/src/view/presentation/widget/order_widgets/order_one_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetAllOrderEvent());
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Container(
            height: context.height*0.13,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: context.height * 0.06,bottom: context.height * 0.02),
                    child: Text(
                      "Your Orders 😉",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28),
                    )),
                ],
              ),
            ),
          
          SizedBox(
            height: context.height * 0.87,
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                if(state is LoadingOrderState)return orderShimmer(context);
                if(state is SuccessOrderState){
                  final List<OrderModel>? data = state.orderData;
                  return data != null && data.isNotEmpty
                    ? data.any((e)=> e.isComplete! == false )  
                      ? Column(
                        children: [
                          SizedBox(
                            height: context.height * 0.57,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              itemBuilder: (context, index) => data[index].isComplete! 
                                ? const SizedBox.shrink() 
                                : orderOneCardWidget(context, data[index])
                            ),
                          ),
                          Container(
                            height: context.height*0.3,
                            padding: const EdgeInsets.symmetric(horizontal: 25, ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: context.height*0.03,),
                                SizedBox(
                                  height: context.height * 0.15,                  
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: ()=> context.navigate(const ChatRoomScreen()),
                                          child: Container(
                                            height: context.height * 0.15,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xfffea8ee),
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child:  Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.chat, size:34),
                                                const SizedBox(height:5),
                                                Text('Chat Support',style: Theme.of(context).textTheme.bodyLarge,),
                                              ],
                                            ),
                                          ),
                                        )),
                                      const SizedBox(width: 20,),
                                      Expanded(
                                        child: InkWell(
                                          onTap: ()=> context.navigate(const DeliverScreen()),
                                          child: Container(
                                            height: context.height * 0.15,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff57b3b3),
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child:  Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.delivery_dining, size:34),
                                                const SizedBox(height:5),
                                                Text('Deliver Location',style: Theme.of(context).textTheme.bodyLarge),
                                              ],
                                            ),
                                            
                                          ),
                                        )),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    final ids = data.map((e)=> e.id!).toList();
                                    context.read<OrderBloc>().add(CompleteOrderEvent(ids));
                                  },
                                  child: Container(
                                    width: context.width,
                                    height: context.height*0.06,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    margin: EdgeInsets.only(bottom: context.height*0.03, top:context.height*0.03),
                                    alignment: Alignment.center,
                                    child: const Text('Deliver Resecived '),
                                  ),
                                )
                              ],
                            ),  
                          )
                        ],
                      )
                      : emptyWidget(context, (){}, false, "The Orders is Empty :)", false)
                    : emptyWidget(context, (){}, false, "The Orders is Empty :)", false);
                }
                if(state is FailOrderState)return Expanded(child: emptyWidget(context, (){}, true, state.error ));
                return Container();
              },
            ),
          ),
         
        ],
      ),
    );
  }
}