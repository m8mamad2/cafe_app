import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:flutter/material.dart';

extension SizeExtenction on BuildContext{
  
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  navigate(Widget widget)=> Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget,));
  navigateReplacement(Widget widget)=> Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (context) => widget));
  navigateBack()=> Navigator.of(this).pop();

  convertImageUrl(String url)=> url.replaceFirst("http://localhost:3000", ApiEndPoints.kBaseUrl);
  
}