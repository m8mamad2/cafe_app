import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/widget/chat_widgets/chat_list_view_builder_widget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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

  
  @override
  void initState() {
    super.initState();
    if(scrollController.hasClients) scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

    
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    messageController.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed:(){},
            icon:const Icon(Icons.arrow_back)
          ),
        ),
        body: Column(
          
          children: [


            //* messages
            Expanded(
              child: ChatListViewBuilderWidget(scrollController: scrollController, focusNode: focusNode,)),

            Container(
              width: context.width,
              height: context.height*0.12,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration:BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow:const[
                  BoxShadow(
                    color: Colors.white12,
                    offset: Offset( 0, -5),
                    blurRadius: 10
                  )
                ]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                      alignment: Alignment.center,
                      height: context.height*0.08,
                      width: context.width*0.75,
                      child: TextField(
                        focusNode: focusNode,
                        controller: messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Theme.of(context).cardColor)
                          ),
                        ),
                      ),
                    ),

                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(context.width *0.14, 50)
                    ),
                    onPressed: (){
                      final MessageData data = MessageData(messages: 'Ok Ok', time: '09:00', type: '', isMine: true);
                      messageList.add(data);
                      scrollController.animateTo( 0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut,);
                      messageController.text = '';
                      setState(() {});
                    }, 
                    child: Icon(Icons.send))
                
                ],
              ),
            )  

          ],
        ),
      ),

    );
  }
  
  

}




class MessageData {
  final String messages;
  final String type;
  final String time;
  final bool isMine;
  MessageData({
      required this.messages,
      required this.time,
      required this.type,
      required this.isMine
    }
  );
}
const String messageTwo = '''سلام وقتتون بخیر خسته نباشید''';
const String messageOne = '''سلام وقتتون بخیر خسته نباشید''';
const String messageLast = 'سلام ممنونبله میتونید در آپارتمان هم نگهداری کنید.';
final messageList = [
  MessageData(messages: 'Ok Ok', time: '09:00', type: '', isMine: true),
  MessageData(messages: 'Ok 2', time: '09:00', type: '', isMine: false),
  MessageData(messages: 'Ok 3', time: '09:00', type: '', isMine: false),
  MessageData(messages: 'Ok 4', time: '09:00', type: '', isMine: true),
];

