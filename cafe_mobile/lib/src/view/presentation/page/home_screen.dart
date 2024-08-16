import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/food_bloc/food_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/home_appbar_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/home_popular_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/home_special_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<FoodBloc>().add(GetAllFoodEvent());
    context.read<UserBloc>().add(CurrentUserEvent(false));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbarWidget(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(  horizontal: 10, ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                  margin: EdgeInsets.only(
                      top: context.height * 0.01,
                      bottom: context.height * 0.02),
                  child: Text(
                    "Find The Delicious \nFood Around you 😋",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 28),
                  )),

              BlocBuilder<FoodBloc, FoodState>(
                builder: (context, state) {
                  if(state is LoadingFoodState)return const CircularProgressIndicator();
                  if(state is SuccessFoodState){
                    return Column(
                      children: [
                        homePopularWidget(context, state.foodData),
                        homeSpecialWidget(context, state.foodData),
                        SizedBox(height: context.height*0.13,),
                      ],
                    );
                  }
                  if(state is FailFoodState)return InkWell(
                    onTap: ()=>context.read<FoodBloc>().add(GetAllFoodEvent()),
                    child: Text("Fail Man ${state.error}", style: const TextStyle(color: Colors.white),));
                  return Container();
                },
              )
            
            ],
          ),
        ),
      ),
    );
  }
}
