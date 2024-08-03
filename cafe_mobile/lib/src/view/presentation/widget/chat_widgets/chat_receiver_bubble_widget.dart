import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

class ChatReceiverBubbleWidget extends StatelessWidget {
  const ChatReceiverBubbleWidget({super.key, required this.receiverMessage});
  final String receiverMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 72,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: context.width*0.035,top: context.width*0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: context.width*0.03,
                  vertical: context.width*0.02),
                decoration: const BoxDecoration(
                  color: Color(0xffd8e8d3),
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(8) ,bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(14),bottomLeft: Radius.circular(14)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receiverMessage,
                      style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                      textAlign: TextAlign.right,
                    ),
                    Container(
                      width: context.width*0.12,
                      margin: EdgeInsets.only(top: context.width*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.check),
                          const Text(
                            '۰۹:۵۵',
                            style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400 ),),
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
        Flexible(
          flex: 15,
          fit: FlexFit.tight,
          child: Container( width: context.width*0.1, ),
        ),
      ],
    );
  }
}
