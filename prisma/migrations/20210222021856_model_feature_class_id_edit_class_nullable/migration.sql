/*
  Warnings:

  - You are about to drop the column `class_id` on the `Feature` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Feature" DROP COLUMN "class_id",
ALTER COLUMN "classId" DROP NOT NULL;
