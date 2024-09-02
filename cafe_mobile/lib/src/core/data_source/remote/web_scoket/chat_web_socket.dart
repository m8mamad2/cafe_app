import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:cafe_mobile/src/core/utils/get_token.dart';
import 'package:cafe_mobile/src/view/data/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatWebSocket{
  
  late Socket socket;
  late List<MessageModel> messages = [];
  Function(List<MessageModel>)? onMessagesReceived;
  Function(MessageModel)? onMessagesSend;

  connecte()async{

    final socketUrl = 'http:${ApiEndPoints.kBaseUrl.split(':')[1]}:3001';
    final token = await GetToken.getToken();
    final header = { "authorization": token! };
    
    
    final option = OptionBuilder()
      .setTransports(['websocket'])
      .setExtraHeaders(header)
      .build();

    
    try{
      socket = io(socketUrl, option);
      socket.connect();

      socket.onConnect((data) => print('------------> Connected '),);
      socket.onConnectError((err) => print('------------> Connected Erro $err'),);
      socket.onDisconnect((err) => print('------------> Disconnect $err'),);
      socket.onError((err) => print('------------> Error $err '),);

      getAllMessage();
      receiverMessage();
      
    }
    catch(e){ print('Erro ----> $e'); }
  }

  getAllMessage()async{
    socket.emit('get_message', { "sender": "1" , "receiver" :  "5" });
    socket.on('get_message', (data) {
      final List<MessageModel> getMessages = (data as List).map((e)=> MessageModel.fromJson(e)).toList();
      messages.addAll(getMessages);
      onMessagesReceived!(getMessages);
    },);
  }

  sendMessage(String data, ){
    MessageModel messageModel = MessageModel(data, "MESSAGE", '1', '5',);
    socket.emit('send_message', messageModel.toJson());
    onMessagesSend!(messageModel);
  }

  receiverMessage(){
    socket.on('receive_message', (message){
      print(message);
      MessageModel parseMessage = MessageModel.fromJson(message);
      print(parseMessage);
      onMessagesSend!(parseMessage);
    });
  }

  dispose(){
    socket.dispose();
  }
  
}