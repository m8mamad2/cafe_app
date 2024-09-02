/*
  Warnings:

  - The `type` column on the `Message` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Message" DROP COLUMN "type",
ADD COLUMN     "type" TEXT NOT NULL DEFAULT 'Message';

-- DropEnum
DROP TYPE "MessageType";

-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "images" TEXT[],
    "price" INTEGER NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);
