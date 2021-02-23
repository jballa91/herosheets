/*
  Warnings:

  - You are about to drop the column `traitId` on the `SubRace` table. All the data in the column will be lost.
  - You are about to drop the column `subRaceId` on the `Trait` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "SubRace" DROP CONSTRAINT "SubRace_traitId_fkey";

-- DropForeignKey
ALTER TABLE "Trait" DROP CONSTRAINT "Trait_subRaceId_fkey";

-- AlterTable
ALTER TABLE "SubRace" DROP COLUMN "traitId";

-- AlterTable
ALTER TABLE "Trait" DROP COLUMN "subRaceId";

-- CreateTable
CREATE TABLE "_subrace_trait_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_trait_choices_AB_unique" ON "_subrace_trait_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_trait_choices_B_index" ON "_subrace_trait_choices"("B");

-- AddForeignKey
ALTER TABLE "_subrace_trait_choices" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_trait_choices" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;
