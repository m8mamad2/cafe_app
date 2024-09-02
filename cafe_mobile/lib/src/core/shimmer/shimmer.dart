
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerWidget(BuildContext context,Widget child,)=>Shimmer.fromColors(
  baseColor: Theme.of(context).cardColor,
  highlightColor: const Color(0xff5c5b53),
  child: child);