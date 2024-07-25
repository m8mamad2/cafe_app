import { Module } from '@nestjs/common';
import { TableReservationController } from './table-reservation.controller';
import { TableReservationService } from './table-reservation.service';
import { DatabaseModule } from 'src/core/database/database.module';

@Module({
  imports:[DatabaseModule],
  controllers: [TableReservationController],
  providers: [TableReservationService]
})
export class TableReservationModule { }
