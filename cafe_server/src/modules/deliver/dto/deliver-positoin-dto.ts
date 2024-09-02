import { IsNotEmpty } from "class-validator";

export class DeliverPostionDto{

    @IsNotEmpty()
    lat: number;
    
    @IsNotEmpty()
    lon: number;

    @IsNotEmpty()
    receiver: string;
    
}