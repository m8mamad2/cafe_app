import { Module } from '@nestjs/common';
import { DeliverService } from './deliver.service';
import { JwtModule } from '@nestjs/jwt';
import { DeliverWebSocketGateway } from './deliver-web-socket-gateway/deliver-web-socket-gateway';
import { DatabaseModule } from 'src/core/database/database.module';

@Module({
  imports: [ JwtModule, DatabaseModule ],
  providers: [ DeliverService, DeliverWebSocketGateway]
})
export class DeliverModule {}
