import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

Widget authTextFieldWidget(BuildContext context, TextEditingController controller, String lable, bool isPassword, bool isHide, VoidCallback onPressHide){

  OutlineInputBorder border([Color? color])=> OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: color ??  Theme.of(context).cardColor,width: 2)
  ); 

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: context.height*0.06,

    child: TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14,fontWeight: FontWeight.w400),
      obscureText: isPassword ? isHide ? true : false : false,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white54,fontWeight: FontWeight.w400,fontSize: 13),
        border: InputBorder.none,
        enabledBorder: border(),
        focusedBorder: border(),
        focusedErrorBorder: border(),
        errorBorder: border(Colors.red),
        suffixIcon: isPassword 
          ? IconButton(
              onPressed: onPressHide, 
              icon :  Icon(isHide ? Icons.visibility : Icons.visibility_off_rounded,color: Theme.of(context).primaryColor,)) 
          : null
    ),
  ));
}