import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
// import { JwtModule } from '@nestjs/jwt';
// import { jwsConstans } from 'src/core/constans';
import { DatabaseModule } from 'src/core/database/database.module';
import { APP_GUARD, Reflector } from '@nestjs/core';
import { AuthGuard } from 'src/core/guard/auth.guard';

@Module({
  imports: [ DatabaseModule, Reflector, ],
  controllers: [AuthController,],
  providers: [
    {
      provide: APP_GUARD,
      useClass: AuthGuard
    },
    AuthService,
  ],
})

export class AuthModule { }
