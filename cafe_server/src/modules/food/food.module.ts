import { Module } from '@nestjs/common';
import { FoodController } from './food.controller';
import { FoodService } from './food.service';
import { DatabaseModule } from 'src/core/database/database.module';

@Module({
  imports:[DatabaseModule],
  controllers: [FoodController],
  providers: [FoodService],
})
export class FoodModule {}
