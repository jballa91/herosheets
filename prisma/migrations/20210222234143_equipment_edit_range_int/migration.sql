/*
  Warnings:

  - The `weapon_range` column on the `Equipment` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Equipment" DROP COLUMN "weapon_range",
ADD COLUMN     "weapon_range" INTEGER;
