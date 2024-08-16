import 'package:cafe_mobile/src/core/constans/value_notifier.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

PreferredSizeWidget homeAppbarWidget(BuildContext context){
  return AppBar(
    actions: [
      BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state is LoadingUserState) return const CircularProgressIndicator();
          if(state is SuccessUserState){
            return Text("👋  Hi ${state.userModel.name ?? 'no name'}",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold,fontSize: 16),);
          }
          if(state is FailUserState)return Text(state.error);
          return Container();
        },  
      ),
      const SizedBox(width: 10,),
    ],
    leadingWidth: context.width * 0.15,
    toolbarHeight: context.height * 0.1,
    leading: InkWell(
      onTap: ()=> bottomNavigationIndex.value = 4,
      child: Container(
        margin: const EdgeInsets.only(left: 10,top: 15,bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor)
        ),
        padding: const EdgeInsets.all(10),
        child: const Icon(Icons.person_outline, color: Colors.white,)
      ),
    ),
  );
}