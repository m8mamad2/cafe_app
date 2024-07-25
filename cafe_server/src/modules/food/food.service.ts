import { Prisma } from '@prisma/client';
import { DatabaseService } from './../../core/database/database.service';
import { BadRequestException, Injectable, NotFoundException, Res } from '@nestjs/common';
import { join } from 'path';
import { Response } from 'express';
import { promises as fs, createReadStream } from 'fs';

@Injectable()
export class FoodService {
    constructor(private readonly databaseService: DatabaseService){ }
    private readonly uploadDirPath = join(__dirname, '../../../','uploads','foods');

    async create(images: Array<Express.Multer.File> ,foodModel: Prisma.FoodCreateInput): Promise<object> {
        try{
            
            images.map(async file =>{
                try{
                    const filePath = join(this.uploadDirPath , file.originalname);
                    await fs.writeFile(filePath, file.buffer);
                }
                catch(e){
                    throw new BadRequestException()
                }
            });
            const imagesUrl = images.map(file => `http://localhost:3000/food/download_image/${file.originalname}`);
            await this.databaseService.food.create({ data: { ...foodModel, images: imagesUrl , price: +foodModel.price } })
            return { message: "ok"};
        }
        catch(e){
            throw new BadRequestException()
        }
    }

    async getAll(): Promise<Prisma.FoodCreateInput[]>{
        try {
            return await this.databaseService.food.findMany()
        }
        catch {
            throw new BadRequestException()
        }
    }

    async clear(){
        try{
            return await this.databaseService.food.deleteMany();
        }
        catch(e){
            throw new BadRequestException()
        }
    }

    async downlaodImage(image: string, @Res() res: Response){
        try{
            const file = join(this.uploadDirPath, image);
            console.log(image);
            console.log(file);
            await fs.access(file);
            const fileStream = createReadStream(file);
            fileStream.pipe(res);
        }
        catch(e){
            throw new NotFoundException()
        }
    }
}
