import 'dart:async';

import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:cafe_mobile/src/core/utils/get_token.dart';
import 'package:cafe_mobile/src/view/data/model/deliver_model.dart';
import 'package:cafe_mobile/src/view/data/model/deliver_models/init_deliver_model.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DeliverWebSocket{
  
  late Socket socket;
  final StreamController<DeliverModel> locationController = StreamController.broadcast();
  final StreamController<InitDeliverModel> initLocationController = StreamController.broadcast();

  connecte()async{

    final socketUrl = 'http:${ApiEndPoints.kBaseUrl.split(':')[1]}:3002';
    final token = await GetToken.getToken();
    final header = { "authorization": token! };
    
    final option = OptionBuilder()
      .setTransports(['websocket'])
      .setExtraHeaders(header)
      .build();

    
    try{
      socket = io(socketUrl, option);
      socket.connect();

      socket.onConnect((data){
        print('------------> Connected ');
      });
      socket.onConnectError((err) => print('------------> Connected Erro $err'),);
      socket.onDisconnect((err) => print('------------> Disconnect $err'),);
      socket.onError((err) => print('------------> Error $err '),);

      getStreamLocation();
      getInitiPosition();
      
    }
    catch(e){ print('Erro ----> $e'); }
  }

  getStreamLocation(){
    socket.on('receiver_position', (data) {
      final parse = DeliverModel.fromJson(data);
      locationController.add(parse);
    });
  }

  getInitiPosition(){
    socket.emit('init_positoin');
    socket.on("get_init_position",(data){
      print('Init Data COme --- > $data');
      final parse = InitDeliverModel.fromJson(data);
      initLocationController.add(parse);
    });
  }

  dispose()=> socket.dispose();
  
  
}
