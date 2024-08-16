-- CreateEnum
CREATE TYPE "MessageType" AS ENUM ('MESSAGE', 'VOICE', 'IMAGE');

-- CreateTable
CREATE TABLE "Message" (
    "id" SERIAL NOT NULL,
    "data" TEXT NOT NULL,
    "type" "MessageType" NOT NULL DEFAULT 'IMAGE',
    "sender" TEXT NOT NULL,
    "receiver" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);
