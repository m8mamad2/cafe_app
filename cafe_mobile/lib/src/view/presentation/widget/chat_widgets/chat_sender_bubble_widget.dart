import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

class ChatSenderBubbleWidget extends StatelessWidget {
  const ChatSenderBubbleWidget({super.key, required this.senderMessage});

  final String senderMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 15,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: context.width*0.04,top: context.width*0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: context.width*0.03,
                  vertical: context.width*0.02),
                decoration:  BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.9),
                  borderRadius:const BorderRadius.only(
                    topLeft:Radius.circular(8) ,bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(14),bottomRight: Radius.circular(14)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      senderMessage,
                      style:Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: context.width*0.12,
                      margin: EdgeInsets.only(top: context.width*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // SvgPicture.asset(kOneTickIcon),
                          Text(
                            '۰۹:۵۵',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //        
        ),
      ],
    );
  }
}
