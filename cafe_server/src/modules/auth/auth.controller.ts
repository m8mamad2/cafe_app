import { AuthService } from './auth.service';
import { Body, Controller, Get, Post,  } from '@nestjs/common';
import { AuthDto } from './dto/auth.dto';
import { Prisma } from '@prisma/client';
import { Public } from 'src/core/guard/auth.metadata';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) { }

    @Public()
    @Post('/login')
    login(@Body() authModel: AuthDto) {
        return this.authService.login(authModel);
    }

    @Public()
    @Post('/signup')
    signup(@Body() authModel: Prisma.UserCreateInput) {
        return this.authService.signUp(authModel);
    }


}
