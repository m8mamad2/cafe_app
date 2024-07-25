import { Prisma } from '@prisma/client';
import { TableReservationService } from './table-reservation.service';
import { Body, Controller, Delete, Get, Post, Put } from '@nestjs/common';
import { TableReservationUpdateDto } from './dta/table-reservation-update.dto';


@Controller('reservation-table')
export class TableReservationController {
    constructor(private readonly tableReservationService: TableReservationService){ }

    @Post('/create')
    cretae(@Body() tableModel: Prisma.TableReservationCreateInput){
        return this.tableReservationService.create(tableModel)
    }

    @Get('/getAll')
    getAll(){
        return this.tableReservationService.getAll()
    }

    @Put('/update')
    update(tableModel: TableReservationUpdateDto){
        return this.tableReservationService.update(tableModel)
    }

    @Delete('/clear')
    clear(){
        return this.tableReservationService.clear()
    }
    
}
