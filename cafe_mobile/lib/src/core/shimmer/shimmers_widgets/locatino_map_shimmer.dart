import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Widget mapLocationShimmer(BuildContext context)=> shimmerWidget(
  context,
  Container(color: Colors.white38,height: context.height, width: double.infinity,));