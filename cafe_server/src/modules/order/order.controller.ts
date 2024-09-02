import { Controller, Delete, Get, Param, ParseIntPipe, Post, Request } from '@nestjs/common';
import { MessageBody } from '@nestjs/websockets';
import { Prisma } from '@prisma/client';
import { OrderService } from './order.service';

@Controller('order')
export class OrderController {
    constructor(private orderService:OrderService ){}

    @Get('getAll')
    getAll(@Request() req){
        return this.orderService.getAll(req);
    }
    
    @Post('add')
    addOrder(@MessageBody() body: Prisma.OrderCreateInput[], @Request() req){
        return this.orderService.addOrder(body, req);
    }

    // @Post('complete_order/:id')
    // completeOrder(@Param('id', ParseIntPipe) id: number , @Request() req){
    @Post('complete_order')
    completeOrder(@MessageBody() ids: { ids: number[] }, @Request() req){
        console.log(ids);
        return this.orderService.completeOrder(ids, req);
    }

    @Delete('delete')
    eleteOrders(){
        return this.orderService.deleteOrders();
    }


    
}
