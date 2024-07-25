import { DatabaseService } from './../../core/database/database.service';
import { BadRequestException,  HttpException, HttpStatus, Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { AuthDto } from './dto/auth.dto';
import { NotExistException } from 'src/core/exception';
import * as bcrypt from 'bcrypt';
import { Prisma } from '@prisma/client';

@Injectable()
export class AuthService {
  constructor( private jwtService: JwtService, private databaseService: DatabaseService ) { }

  async login(authModel: AuthDto) {

    if(!authModel.email || !authModel.password)
      throw new BadRequestException();

    const user = await this.databaseService.user.findUnique({
      where: { email: authModel.email },
    });

    if (!user) throw new NotExistException();

    const isCurrectPassword = await bcrypt.compare(authModel.password, user.password);

    if (isCurrectPassword) {
      const payload = { sub: user.id, username: user.userName };
      const token = await this.jwtService.signAsync(payload);
      return { access_token: token };
    }
    else throw new UnauthorizedException();

  }

  async signUp(authModel: Prisma.UserCreateInput) {
    if (!authModel.password || !authModel.email) 
      throw new BadRequestException();

    try{
      const password = await bcrypt.hash(authModel.password, 10);
      const res = await this.databaseService.user.create({
        data: { ...authModel, password: password },
      });
      return { data : res };
    }
    catch(e){
      throw new HttpException(e, HttpStatus.BAD_REQUEST);
    }

  }

}

