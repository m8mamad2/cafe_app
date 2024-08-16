
import 'package:flutter/material.dart';

Widget oneChairWidget(BuildContext context, int chairsNumber, bool isSelected, bool isReserved)=>Container(
  width:  35,
  height: 35,
  margin:  EdgeInsets.only(bottom: 40,left: chairsNumber == 2 ? 20 : 14),
  decoration:  BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: isSelected || isReserved ? Theme.of(context).primaryColor :Colors.white24),
    color: isSelected || isReserved ?  Theme.of(context).primaryColor.withOpacity(0.4) : Colors.white24,
  ),
);



