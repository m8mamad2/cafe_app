import { TableReservationUpdateDto } from './dta/table-reservation-update.dto';
import { DatabaseService } from './../../core/database/database.service';
import { Prisma } from '@prisma/client';
import { BadRequestException, Injectable } from '@nestjs/common';

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

 }
