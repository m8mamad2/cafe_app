import 'package:cafe_mobile/src/core/data_source/remote/web_scoket/chat_web_socket.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/data/model/message_model.dart';
import 'package:cafe_mobile/src/view/presentation/widget/chat_widgets/chat_list_view_builder_widget.dart';
import 'package:flutter/material.dart';




class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}
class _ChatRoomScreenState extends State<ChatRoomScreen> with TickerProviderStateMixin{
  
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  final ChatWebSocket chatWebSocket = ChatWebSocket();
  List<MessageModel> messages = [];
  
  @override
  void initState() {
    super.initState();

    if(mounted){
      chatWebSocket.connecte();
      chatWebSocket.onMessagesReceived = (List<MessageModel> message)=>setState(()=> messages = message);
      chatWebSocket.onMessagesSend = (MessageModel message)=>setState(()=> messages.add(message) );
      if(scrollController.hasClients) scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

    
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    messageController.dispose();
    focusNode.dispose();
    chatWebSocket.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.navigateBack,
            icon:const Icon(Icons.arrow_back, color: Colors.white,)
          ),
          bottom: PreferredSize(
            preferredSize: Size(context.width, context.height*0.013), 
            child: Container(width: context.width,height: 7,color: Theme.of(context).primaryColor,)),
          actions: [
            Text('Admin', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),),
            Container(
              margin: const EdgeInsets.only(right: 15,left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.person_outlined, color: Theme.of(context).primaryColor,),
              ),
            ),
          ],
        ),
        body: Column(
          
          children: [

            Expanded(
              child: ChatListViewBuilderWidget(scrollController: scrollController, focusNode: focusNode,messages: messages,)),

            Container(
              width: context.width,
              height: context.height*0.09,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration:BoxDecoration(
                border: Border(top: BorderSide(color: Theme.of(context).primaryColor)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                      alignment: Alignment.center,
                      width: context.width*0.82,
                      margin: const EdgeInsets.only(left: 10),
                      child: TextField(
                        focusNode: focusNode,
                        controller: messageController,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          enabledBorder: messageTextFieldStyle(context),
                          focusedBorder: messageTextFieldStyle(context),
                          disabledBorder: messageTextFieldStyle(context),
                          errorBorder: messageTextFieldStyle(context)
                        ),
                      ),
                    ),

                  InkWell(
                    onTap: ()async{

                      chatWebSocket.sendMessage(messageController.text.trim());
                      messageController.clear();
                      // final MessageData data = MessageData(messages: 'Ok Ok', time: '09:00', type: '', isMine: true);
                      // messageList.add(data);
                      // scrollController.animateTo( 0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut,);
                      // messageController.text = '';
                      // setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10 ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.send, color: Colors.white,),
                      )),
                  )
                
                ],
              ),
            )  

          ],
        ),
      ),

    );
  }
  
  

}


messageTextFieldStyle(BuildContext context)=> OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: Theme.of(context).cardColor)
);