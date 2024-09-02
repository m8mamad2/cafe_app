/*
  Warnings:

  - You are about to drop the `AddressModel` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_addressId_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "address" INTEGER[];

-- DropTable
DROP TABLE "AddressModel";
