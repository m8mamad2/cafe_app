/*
  Warnings:

  - The `images` column on the `Food` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Food" DROP COLUMN "images",
ADD COLUMN     "images" JSONB[];
