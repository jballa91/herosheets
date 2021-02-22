/*
  Warnings:

  - The `languages_desc` column on the `Race` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Race" DROP COLUMN "languages_desc",
ADD COLUMN     "languages_desc" TEXT[];
