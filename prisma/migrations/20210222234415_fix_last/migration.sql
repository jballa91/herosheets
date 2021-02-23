/*
  Warnings:

  - The `range` column on the `Equipment` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Equipment" DROP COLUMN "range",
ADD COLUMN     "range" INTEGER,
ALTER COLUMN "weapon_range" SET DATA TYPE TEXT;
