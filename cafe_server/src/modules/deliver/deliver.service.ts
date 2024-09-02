import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { WsException } from '@nestjs/websockets';
import { Socket } from 'socket.io';
import { jwsConstans } from 'src/core/constans';
import { DeliverPostionDto } from './dto/deliver-positoin-dto';
import { DatabaseService } from 'src/core/database/database.service';
import { InitPositionDto } from './dto/init-positoin-dto';

@Injectable()
export class DeliverService {
    constructor(private jwtService: JwtService, private databaseService: DatabaseService){ }

    async onConnected(socket: Socket){
        const token = socket.handshake.headers.authorization;
        if (!token)
            throw new WsException('Not TOken');

        try {
            const payload = await this.jwtService.verifyAsync( token, { secret: jwsConstans.secret } )
            return payload
        }
        catch (e){ 
            console.log('error ' + e);
        }
    }

    async sendPosition(postion: DeliverPostionDto, socket:Socket){
        try{            
            socket.to(postion.receiver).emit('receiver_position', postion);
        }
        catch(e){
            console.log(e)
        }
    }

    async initPosition(socket:Socket){
        try{
            const user = await this.databaseService.user.findFirst({ where: { id: Number( socket.data.user )} })
            const cafePosition = [34.00712617049738,51.42496347427369]
            const deliverInitPostion: DeliverPostionDto = { lat: cafePosition[0], lon:cafePosition[1], receiver:'' }
            const res: InitPositionDto = { start_point: cafePosition, end_point: user.address, deliver_init_point: deliverInitPostion }
            socket.emit('get_init_position', res);
        }
        catch(e){
            console.log('error ------ ' + e)
        }
    }

}
