# Food Delivery App with Flutter And Nestjs

## Project Description

This is a full-stack food delivery app built with **Flutter** for the mobile front-end and **NestJS** for the back-end. The app enables users to browse restaurants, order food, track delivery in real-time, and communicate with delivery personnel via in-app chat. 

## Features

- **Order Food**: Users can browse available restaurants, search for items, and place food orders.
- **Food Delivery**: Delivery personnel can pick up the order from the restaurant and deliver it to the customer.
- **Real-Time Chat**: Users can chat with the delivery person in real-time to ask questions or provide instructions.
- **Location Streaming**: The app tracks the real-time location of the delivery person and streams it to the user.
- **Payment Integration**: Supports online payments using third-party payment gateways.
- **Reserve Table**: Users can Reserve Table

## Technology Stack

### Front-End
- **Flutter**: For building the cross-platform mobile app (iOS and Android).
- **Dart**: Programming language for Flutter.

### Back-End
- **NestJS**: Node.js framework for building scalable server-side applications.
- **TypeScript**: Main programming language for the backend.
- **Socket.io**: For real-time chat and location streaming.
- **JWT Authentication**: To secure API endpoints.
- **PostgreSQL**: Relational database for storing structured data.
- **Prisma ORM**: Used for database migrations, querying, and managing PostgreSQL..

### Deployment
- **Heroku** (or any cloud provider): For hosting the NestJS backend.
- **Firebase**: For push notifications.
- **Docker**: Containerization for both front-end and back-end (optional).

## Installation

#### 1. Front (Flutter)


Clone the Flutter project::
```bash
    git clone https://github.com/m8mamad2/cafe_app.git  
```
Navigate to the project directory:
```bash
    cd cafe_mobile
```
Install dependencies:
```bash
    flutter pub get
``` 
Run App:
```bash
    flutter run
``` 

#### 2. Backend (NestJs)


Clone the NestJs project::
```bash
    git clone https://github.com/m8mamad2/cafe_app.git  
```
Navigate to the project directory:
```bash
    cd cafe_server
```
Install dependencies:
```bash
    npm install
``` 
Run Prisma migrations to set up the database schema:
```bash
    npx prisma migrate dev
``` 
Start the NestJS server:
```bash
    npm run start:dev
```
