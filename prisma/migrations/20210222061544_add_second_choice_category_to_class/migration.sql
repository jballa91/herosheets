/*
  Warnings:

  - Added the required column `starting_equipment_choices2` to the `Class` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Class" ADD COLUMN     "starting_equipment_choices2" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Equipment" ADD COLUMN     "classId" INTEGER;

-- AddForeignKey
ALTER TABLE "Equipment" ADD FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE SET NULL ON UPDATE CASCADE;
