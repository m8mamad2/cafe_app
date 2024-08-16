import { AuthService } from './auth.service';
import { Body, Controller, Get, Post, Put, Request } from '@nestjs/common';
import { AuthDto, UpdateUserDto } from './dto/auth.dto';
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

    @Put('/update')
    updateUser(@Body() updateModel: Prisma.UserCreateInput, @Request() req){
        return this.authService.updateUser(updateModel, req);
    }

    @Get('/curretn_user')
    getCurrentUser(@Request() req){
        return this.authService.getCurrentUser(req);
    }
}

// {
//     "id": 3,
//     "email": "ghasem@gmail.com",
//     "userName": "ghasem",
//     "name": "",
//     "family": "",
//     "address": "",
//     "phoneNumber": "",
//     "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjMsInVzZXJuYW1lIjoiZ2hhc2VtIiwiaWF0IjoxNzIzNDA4ODI3fQ.FLah3o_TXjLrRI3hd1y0TqaocKQm68frpAi7yijv19Q",
//     "localId": 3
//   }