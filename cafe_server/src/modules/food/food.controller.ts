import { Prisma } from '@prisma/client';
import { FoodService } from './food.service';
import { Body, Controller, Get, Param, Post, Res, UploadedFiles, UseInterceptors } from '@nestjs/common';
import { FilesInterceptor } from '@nestjs/platform-express';
import { Response } from 'express';


@Controller('food')
export class FoodController {
    constructor(private readonly foodService: FoodService) { }

    @Post('/create')
    @UseInterceptors(FilesInterceptor('images', 5))
    create(@Body() foodModel: Prisma.FoodCreateInput, @UploadedFiles() images: Array<Express.Multer.File>,) {
        return this.foodService.create(images, foodModel);
    }

    @Get('/getAll')
    getAll() {
        return this.foodService.getAll();
    }

    @Get('/clear')
    clear() {
        return this.foodService.clear()
    }

    @Get('/download_image/:image')
    downlaodImage(@Param('image') image: string, @Res() res: Response) {
        return this.foodService.downlaodImage(image, res);
    }

}

