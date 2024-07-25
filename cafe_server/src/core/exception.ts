import { HttpException, HttpStatus } from "@nestjs/common";

export class NotExistException extends HttpException{
    constructor(){
        super('User Not Exist', HttpStatus.NOT_FOUND);
    }
}