import { IsEmail, IsNotEmpty } from 'class-validator';
export class AuthDto {

    @IsNotEmpty()
    @IsEmail()
    email: string;

    @IsNotEmpty()
    password: string;

}


export class UpdateUserDto {
    key: string;
    value: string;
}