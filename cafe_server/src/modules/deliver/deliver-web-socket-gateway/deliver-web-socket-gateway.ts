import { ConnectedSocket, MessageBody ,OnGatewayConnection, OnGatewayDisconnect, SubscribeMessage, WebSocketGateway, WebSocketServer } from "@nestjs/websockets";
import { DeliverService } from "../deliver.service";
import { Socket, Server } from "socket.io";
import { DeliverPostionDto } from "../dto/deliver-positoin-dto";

@WebSocketGateway(3002, {})
export class DeliverWebSocketGateway implements OnGatewayConnection, OnGatewayDisconnect {
    
    constructor(private deliverService: DeliverService){ }
    @WebSocketServer() wss: Server;

    async handleConnection(socket: Socket) {
        const token = await this.deliverService.onConnected(socket);
        const dataToken = String(token.sub)
        console.log('User Joing ------> ' + dataToken);
        socket.join(dataToken);
        socket.data.user = dataToken
    }
    
    handleDisconnect(socket: Socket) {
        console.log('User Disconnected----' + socket.data.user);
    }

    @SubscribeMessage('init_positoin')
    initPositoin(@ConnectedSocket() socket:Socket){
        console.log(this.wss.sockets.adapter.rooms);
        return this.deliverService.initPosition(socket);
    }

    @SubscribeMessage('send_position')
    sendPositoin(@MessageBody() postion: DeliverPostionDto, @ConnectedSocket() socket:Socket){
        return this.deliverService.sendPosition(postion, socket);
    }

}   