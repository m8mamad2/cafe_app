import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.useGlobalPipes(new ValidationPipe());
  
  await app.listen(3000);
}
bootstrap();

// {
//   "id": 7,
//   "email": "m8mamad2@gmail.com",
//   "userName": "m8mamad2",
//   "name": "GHASEM",
//   "family": "",
//   "addressId": null,
//   "address": [],
//   "phoneNumber": "",
//   "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjcsInVzZXJuYW1lIjoibThtYW1hZDIiLCJpYXQiOjE3MjQ0NDkxNjN9.O1mqb4EKZ_rXWkluRC8qkNwABHiDjE5DE-XxoM_yD5Y",
//   "localId": 7
// }

// {
//   "id": 12,
//   "email": "m8mahdi@gmail.com",
//   "userName": "m8mahdi2",
//   "name": "GHASEM",
//   "family": "",
//   "addressId": null,
//   "address": [],
//   "phoneNumber": "09371617431",
//   "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEyLCJ1c2VybmFtZSI6Im04bWFoZGkyIiwiaWF0IjoxNzI0NDQ5NTk4fQ.iygQpanu-Gj-Lyh22Sfwsjcq4vsH9eYA1aOcwUsbqDI",
//   "localId": 12
// }