import { DatabaseService } from './../../core/database/database.service';
import { BadRequestException, HttpException, HttpStatus, Injectable, UnauthorizedException , Request} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { AuthDto, UpdateUserDto } from './dto/auth.dto';
import { NotExistException } from 'src/core/exception';
import * as bcrypt from 'bcrypt';
import { Prisma } from '@prisma/client';

@Injectable()
export class AuthService {
  constructor(private jwtService: JwtService, private databaseService: DatabaseService) { }

  async login(authModel: AuthDto) {

    if (!authModel.email || !authModel.password)
      throw new BadRequestException();

    const user = await this.databaseService.user.findUnique({
      where: { email: authModel.email },
    });

    if (!user) throw new NotExistException();

    const isCurrectPassword = await bcrypt.compare(authModel.password, user.password);

    if (isCurrectPassword) {
      const payload = { sub: user.id, username: user.userName };
      const token = await this.jwtService.signAsync(payload);
      return { ...user, access_token: token, localId: user.id };
    }
    else throw new UnauthorizedException();

  }

  async signUp(authModel: Prisma.UserCreateInput) {
    if (!authModel.password || !authModel.email)
      throw new BadRequestException();

    try {
      const password = await bcrypt.hash(authModel.password, 10);
      const res = await this.databaseService.user.create({
        data: { ...authModel, password: password, address: authModel.address ?? [] },
      });
      const payload = { sub: res.id, username: res.userName };
      const token = await this.jwtService.signAsync(payload);
      return { ...res, password: undefined, access_token: token, localId: res.id };
    }
    catch (e) {
      console.log(e)
      throw new HttpException(e, HttpStatus.BAD_REQUEST);
    }

  }

  async updateUser(updateModel: Prisma.UserCreateInput ,@Request() req){
    try{
      const user = req.user;
      await this.databaseService.user.update({
        where: { id: user.sub },
        data: updateModel
      });
      return { msg: "ok" };
    }
    catch(e){
      console.log(e);
      throw new BadRequestException()
    }
  }

  async getCurrentUser(@Request() req){
    try{
      const user = req.user;
      const token = await this.jwtService.signAsync(user);
      const data =  await this.databaseService.user.findUnique({ where: { id: user.sub } });
      return { ...data, access_token: token };
    }
    catch(e){
      throw new BadRequestException()
    }
  }

  async getAll(){
    return await this.databaseService.user.findMany();
  }

  async deleteAll(){
    return await this.databaseService.user.deleteMany();
  }


}



