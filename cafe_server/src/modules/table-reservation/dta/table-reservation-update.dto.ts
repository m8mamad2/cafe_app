import { IsBoolean, IsNotEmpty } from 'class-validator';
export class TableReservationUpdateDto {

    @IsNotEmpty()
    id: number;

    @IsBoolean()
    @IsNotEmpty()
    is_reserver: boolean;

    @IsNotEmpty()
    reserved_date: string;

    @IsNotEmpty()
    reserved_hour: string;

}
