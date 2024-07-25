import { Module } from '@nestjs/common';
import { ChatWebSocketService } from './chat-web-socket.service';
import { ChatWebSocketGateway } from './chat-web-socket-geteway/chat-web-socket.geteway';
import { DatabaseModule } from 'src/core/database/database.module';

@Module({
  imports: [ DatabaseModule ],
  providers: [ChatWebSocketService, ChatWebSocketGateway],
})
export class ChatWebSocketModule {}
