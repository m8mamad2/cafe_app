import { TableReservationUpdateDto } from './dta/table-reservation-update.dto';
import { DatabaseService } from './../../core/database/database.service';
import { Prisma } from '@prisma/client';
import { BadRequestException, Injectable } from '@nestjs/common';
import { Cron, CronExpression } from '@nestjs/schedule';

@Injectable()
export class TableReservationService {
    constructor(private readonly databaseService: DatabaseService) { }

    async create(tableModel: Prisma.TableReservationCreateInput){
        try{
            await this.databaseService.tableReservation.create( { data : tableModel } );
            return { res : 'ok' }
        }
        catch(e){
            console.log("table Reservation _>" +e);
            throw new BadRequestException();
        }
    }
    
    async getAll(){
        try{
            return await this.databaseService.tableReservation.findMany();
        }
        catch(e){
            throw new BadRequestException()
        }
    }
    
    async update(tableReservationDto :TableReservationUpdateDto){
        try{
            
            await this.databaseService.tableReservation.update({
                where: { id: tableReservationDto.id },
                data:  {
                    is_reserver: tableReservationDto.is_reserver,
                    reserved_date: tableReservationDto.reserved_date,
                    reserved_hour: tableReservationDto.reserved_hour,
                }
            });
            return { res: 'ok' }
        }
        catch(e){
            console.log(e);
            throw new BadRequestException()
        }
    }   
    
    async clear(){
        try{
            await this.databaseService.tableReservation.deleteMany({});
            return { res : 'ok' }
        }
        catch(e){
            throw new BadRequestException()
        }
    }

    @Cron(CronExpression.EVERY_DAY_AT_1PM)
    async deleteEndOfDay(){
        try{
            await this.databaseService.tableReservation.updateMany({ 
                data:{ is_reserver: false }
            });
        }
        catch(e){
            console.log(e);
        }
    }

 }


 