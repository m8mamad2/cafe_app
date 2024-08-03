import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

class ChatSenderBubbleWidget extends StatelessWidget {
  const ChatSenderBubbleWidget({super.key, required this.senderMessage});

  final String senderMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 15,
          fit: FlexFit.tight,
          child: Container(
            width: context.width*0.1,
          ),
        ),
        Flexible(
          flex: 72,
          fit: FlexFit.tight,
          child: Container(
            margin: EdgeInsets.only(left: context.width*0.04,top: context.width*0.02),
            padding: EdgeInsets.symmetric(
              horizontal: context.width*0.03,
              vertical: context.width*0.02),
            decoration: const BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(8) ,bottomLeft: Radius.circular(8),
                topRight: Radius.circular(14),bottomRight: Radius.circular(14)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  senderMessage,
                  style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                Container(
                  width: context.width*0.12,
                  margin: EdgeInsets.only(top: context.width*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SvgPicture.asset(kOneTickIcon),
                      const Text(
                        '۰۹:۵۵',
                        style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400 ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //        
        ),
      ],
    );
  }
}
