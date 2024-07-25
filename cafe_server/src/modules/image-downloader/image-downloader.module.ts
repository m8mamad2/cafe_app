import { Module } from '@nestjs/common';
import { ImageDownloaderController } from './image-downloader.controller';
import { ImageDownloaderService } from './image-downloader.service';

@Module({
  controllers: [ImageDownloaderController],
  providers: [ImageDownloaderService]
})
export class ImageDownloaderModule {}
