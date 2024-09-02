import { IsNotEmpty } from "class-validator";

export class ChatGetMessageDto{

    @IsNotEmpty()
    receiver: string;
    
    @IsNotEmpty()
    sender: string;
    
}