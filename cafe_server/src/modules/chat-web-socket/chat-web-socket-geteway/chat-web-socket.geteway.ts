import { ConnectedSocket, MessageBody, OnGatewayConnection, OnGatewayDisconnect, SubscribeMessage, WebSocketGateway, WebSocketServer, } from '@nestjs/websockets';
import { Server, Socket } from "socket.io"
import { ChatWebSocketService } from '../chat-web-socket.service';
import { Prisma } from '@prisma/client';

@WebSocketGateway(3001, {})
export class ChatWebSocketGateway implements OnGatewayConnection, OnGatewayDisconnect {

    constructor(private chatWebSocketService: ChatWebSocketService) { }
    @WebSocketServer() wss: Server;


    async handleConnection(socket: Socket) {
        const token = await this.chatWebSocketService.onConnected(socket);
        const dataToken = String(token.sub)
        socket.join(dataToken);
        socket.data.user = dataToken
    }

    handleDisconnect(socket: Socket) {
        console.log("Dicsonccetd User ", socket.data.user);
    }

    @SubscribeMessage('send_message')
    async sendMessage(@MessageBody() data: Prisma.MessageCreateInput, @ConnectedSocket() socket: Socket) {
        return this.chatWebSocketService.sendMessage(data, socket, this.wss);
    }

    @SubscribeMessage('get_message')
    getMessage( @MessageBody() data: object, @ConnectedSocket() socket: Socket) {
        return this.chatWebSocketService.getMessage(data, socket);
    }


}
