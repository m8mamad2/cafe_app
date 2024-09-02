import { BadRequestException, Injectable, Request } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/core/database/database.service';

@Injectable()
export class OrderService {
    constructor(private readonly databaseService: DatabaseService){}

    async getAll(@Request() req){
        try{
            const userId = req.user.sub;
            return await this.databaseService.order.findMany({ where: { userId: userId } });
        }
        catch(e){
            return new BadRequestException();
        }
    }

    async addOrder(body: Prisma.OrderCreateInput[], @Request() req){
        try{
            const userId = req.user.sub;
            const bodyWithUserId = body.map( e => ({ ...e , userId: userId}) )
            await this.databaseService.order.createMany({ data: bodyWithUserId });
            return { 'msg' : 'ok' };
        }
        catch(e){
            return new BadRequestException();
        }
    }

    async completeOrder(orderIds: { ids: number[] }, @Request() req){
        try{
            const userId = req.user.sub;
            // const updateOrder = orderIds.ids.map( async id => 
            //     await this.databaseService.order.update({
            //     where:{ id: id, userId: userId },
            //     data: { isComplete: true }
            // }))

            // await Promise.all(updateOrder);

            await this.databaseService.order.deleteMany({ where:{ userId: userId } })

            return { 'msg' : 'ok' };
        }
        catch(e){
            return new BadRequestException();
        }
    }

    async deleteOrders(){
        try{
            await this.databaseService.order.deleteMany();
            return { 'msg' : 'ok' };
        }
        catch(e){
            return new BadRequestException();
        }
    }

}
