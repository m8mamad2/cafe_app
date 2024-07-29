import 'package:flutter/material.dart';

extension SizeExtenction on BuildContext{
  
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  navigate(Widget widget)=> Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget,));
  navigateReplacement(Widget widget)=> Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (context) => widget));
  navigateBack()=> Navigator.of(this).pop();
  
}