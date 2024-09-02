import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';



class OrderedBeforeScreen extends StatefulWidget {
  const OrderedBeforeScreen({super.key});
  @override
  _OrderedBeforeScreenState createState() => _OrderedBeforeScreenState();
}
class _OrderedBeforeScreenState extends State<OrderedBeforeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: CustomScrollView(
          slivers: [
      
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              snap: true,
              pinned: true,
              expandedHeight: context.height * 0.5,
              toolbarHeight: context.height *0.09,
              centerTitle: true,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
              actions: [Container(width: 20, height:20,color:Colors.amber)],
              leading: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                      TextSpan(
                        text: "سلام ",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(text: ' علی 👋', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold))
                        ]
                      )
                    ),
                ),
              ),
              leadingWidth: context.width * 0.4,
              flexibleSpace: Container(
                width: 40,
                height: 40,
                color: Colors.red,
              )
          ),
            
            SliverToBoxAdapter(
              child: Container(
                constraints: BoxConstraints( minHeight: context.height * 0.6 ),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: BorderDirectional(
                    top: BorderSide(color: Theme.of(context).primaryColor,width: 3 )),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 10),
                        child: Text('تسک ها ', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),)),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) => Container(width: context.width, height: 40, color:Colors.orange,)),
                    ],
                  ),
                )
              )
            )
          
          ],
        ),
        // bottomNavigationBar: const CustomCurvedNavigationBar(),
      ),
    );
  }
}
