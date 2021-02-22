/*
  Warnings:

  - You are about to drop the column `subclass_id` on the `Feature` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Feature" DROP COLUMN "subclass_id",
ALTER COLUMN "subClassId" DROP NOT NULL;
