/*
  Warnings:

  - You are about to drop the column `subRaceId` on the `Trait` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Trait" DROP CONSTRAINT "Trait_subRaceId_fkey";

-- AlterTable
ALTER TABLE "Trait" DROP COLUMN "subRaceId";

-- CreateTable
CREATE TABLE "_SubRaceToTrait" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_SubRaceToTrait_AB_unique" ON "_SubRaceToTrait"("A", "B");

-- CreateIndex
CREATE INDEX "_SubRaceToTrait_B_index" ON "_SubRaceToTrait"("B");

-- AddForeignKey
ALTER TABLE "_SubRaceToTrait" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubRaceToTrait" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;
