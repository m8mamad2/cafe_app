import { Module } from '@nestjs/common';
import { DatabaseModule } from './core/database/database.module';
import { AuthModule } from './modules/auth/auth.module';
import { FoodModule } from './modules/food/food.module';
import { ServeStaticModule } from "@nestjs/serve-static";
import { join } from 'path';
import { ChatWebSocketModule } from './modules/chat-web-socket/chat-web-socket.module';
import { JwtModule } from '@nestjs/jwt';
import { jwsConstans } from './core/constans';
import { ImageDownloaderModule } from './modules/image-downloader/image-downloader.module';
import { TableReservationModule } from './modules/table-reservation/table-reservation.module';

@Module({
  imports: [
    DatabaseModule,
    AuthModule,
    FoodModule,
    ChatWebSocketModule,
    ImageDownloaderModule,
    TableReservationModule,
    JwtModule.register({ global: true, secret: jwsConstans.secret, }),
    ServeStaticModule.forRoot({ rootPath: join(__dirname, '..', '/uploads'), }),
  ],
  controllers: [],
  providers: [],
})
export class AppModule { }
