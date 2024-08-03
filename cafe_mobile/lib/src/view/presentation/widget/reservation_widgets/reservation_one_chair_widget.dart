
import 'package:flutter/material.dart';

Widget oneChairWidget(BuildContext context, int chairsNumber)=>Container(
  width:  35,
  height: 35,
  margin:  EdgeInsets.only(bottom: 40,left: chairsNumber == 2 ? 20 : 14),
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color :Colors.white24,
  ),
);



