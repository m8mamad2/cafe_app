
import 'package:cafe_mobile/src/core/constans/bottom_navigation_bar_items.dart';
import 'package:cafe_mobile/src/core/constans/value_notifier.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/widget/profile_widgets/profile_update_address_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget profileOneCardWidget(BuildContext context, String title, String subTitle, String key) =>

    InkWell(
      onTap: key.isEmpty 
        ? ()=> bottomNavigationIndex.value = 1
        : key.contains('address')
          ? ()=> context.navigate( const ProfileUpdateAddressMapWidget() )
          : ()=> changeProfileDetailBottomShet(context, title, key),
          
      child: Container(
        width: double.infinity,
        height: context.height * 0.08,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(subTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );



Future changeProfileDetailBottomShet(BuildContext context,String lable, String key)async{

  TextEditingController controller = TextEditingController();
  OutlineInputBorder border([Color? color])=> OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: color ??  Theme.of(context).cardColor,width: 2)
  ); 

  return await showModalBottomSheet(
    context: context, 
    isScrollControlled: true, 
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) => Padding(
      padding:  EdgeInsets.only( 
        left: 15,
        right: 15,
        bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFormField(
              autofocus: true,
              controller: controller,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14,fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                labelText: lable,
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white54,fontWeight: FontWeight.w400,fontSize: 13),
                border: InputBorder.none,
                enabledBorder: border(),
                focusedBorder: border(),
                focusedErrorBorder: border(),
                errorBorder: border(Colors.red),
            ),
                    ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if(state is SuccessUserState) context.navigateBack();
              },
              builder: (context, state) {
                if(state is LoadingUserState)return button(context, (){}, true);
                if(state is SuccessUserState)return button(context, ()=> context.read<UserBloc>().add(UpdateUserEvent(key, controller.text)), false);
                if(state is FailUserState)return    button(context, ()=> context.read<UserBloc>().add(UpdateUserEvent(key, controller.text)), false, true, state.error);
                return Container();
              },
              
            ),
          )
        
        ],
      ),
    ));

}


Widget button(BuildContext context, VoidCallback onPress, bool isLoading, [bool? isFail, String? error])=>ElevatedButton(
  onPressed: onPress, 
  style: ElevatedButton.styleFrom(
    minimumSize: Size(context.width, 50),
    backgroundColor: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    )
  ),
  child:  isLoading
      ? const CircularProgressIndicator(color: Colors.white,)
      : isFail ?? false  
        ? Text( error!, style: const TextStyle(color: Colors.white))
        : const Text('Taht si Fine', style: TextStyle(color: Colors.white),));