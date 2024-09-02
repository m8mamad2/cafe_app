import { ConnectedSocket, MessageBody, OnGatewayConnection, OnGatewayDisconnect, SubscribeMessage, WebSocketGateway, WebSocketServer, } from '@nestjs/websockets';
import { Server, Socket } from "socket.io"
import { ChatWebSocketService } from '../chat-web-socket.service';
import { Prisma } from '@prisma/client';
import { ChatGetMessageDto } from '../dto/chat-get-message-dto';

@WebSocketGateway(3001, {})
export class ChatWebSocketGateway implements OnGatewayConnection, OnGatewayDisconnect {

    constructor(private chatWebSocketService: ChatWebSocketService) { }
    @WebSocketServer() wss: Server;


    async handleConnection(socket: Socket) {
        const token = await this.chatWebSocketService.onConnected(socket);
        const dataToken = String(token.sub)
        console.log('User Joing ------> ' + dataToken);
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
    getMessage( @MessageBody() data: ChatGetMessageDto, @ConnectedSocket() socket: Socket) {
        return this.chatWebSocketService.getMessage(data, socket);
    }

    @SubscribeMessage('ok')
    getOK(socket: Socket){
        return this.chatWebSocketService.ok(this.wss);
    }
    
}




// import { SubscribeMessage, WebSocketGateway, WebSocketServer, MessageBody, ConnectedSocket } from '@nestjs/websockets';
// import { Server, Socket } from 'socket.io';

// @WebSocketGateway({ namespace: '/namespace1' }) // Namespace 1
// export class Namespace1Gateway {
//   @WebSocketServer() server: Server;

//   @SubscribeMessage('message')
//   handleMessage(@MessageBody() data: string, @ConnectedSocket() client: Socket): void {
//     console.log('Namespace 1: ', data);
//     this.server.emit('message', `Namespace 1: ${data}`);
//   }
// }

// @WebSocketGateway({ namespace: '/namespace2' }) // Namespace 2
// export class Namespace2Gateway {
//   @WebSocketServer() server: Server;

//   @SubscribeMessage('message')
//   handleMessage(@MessageBody() data: string, @ConnectedSocket() client: Socket): void {
//     console.log('Namespace 2: ', data);
//     this.server.emit('message', `Namespace 2: ${data}`);
//   }
// }


// @Injectable()
// export class SocketService {
//   constructor(
//     private readonly namespace1Gateway: Namespace1Gateway,
//     private readonly namespace2Gateway: Namespace2Gateway,
//   ) {}

//   sendToNamespace1(data: string) {
//     this.namespace1Gateway.server.emit('message', data);
//   }

//   sendToNamespace2(data: string) {
//     this.namespace2Gateway.server.emit('message', data);
//   }
// }

