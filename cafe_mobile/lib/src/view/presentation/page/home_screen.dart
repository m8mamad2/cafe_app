
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/home_appbar_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/home_popular_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/home_special_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbarWidget(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Container(
                margin: EdgeInsets.only(top: context.height*0.04,bottom: context.height*0.04),
                child: Text(
                  "Find The Delicious \nFood Around you 😋",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28),)),
          
              homePopularWidget(context),
          
              homeSpecialWidget(context),
          
            ],
          ),
        ),
      ),
    );
  }
}


