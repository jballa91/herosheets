/*
  Warnings:

  - You are about to drop the column `subRaceId` on the `Trait` table. All the data in the column will be lost.
  - You are about to drop the `_SubRaceToTrait` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_subrace_language_choices` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_subrace_languages` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_SubRaceToTrait" DROP CONSTRAINT "_SubRaceToTrait_A_fkey";

-- DropForeignKey
ALTER TABLE "_SubRaceToTrait" DROP CONSTRAINT "_SubRaceToTrait_B_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_language_choices" DROP CONSTRAINT "_subrace_language_choices_A_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_language_choices" DROP CONSTRAINT "_subrace_language_choices_B_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_languages" DROP CONSTRAINT "_subrace_languages_A_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_languages" DROP CONSTRAINT "_subrace_languages_B_fkey";

-- DropForeignKey
ALTER TABLE "Trait" DROP CONSTRAINT "Trait_subRaceId_fkey";

-- AlterTable
ALTER TABLE "Trait" DROP COLUMN "subRaceId";

-- CreateTable
CREATE TABLE "_subrace_traits" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_subrace_trait_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- DropTable
DROP TABLE "_SubRaceToTrait";

-- DropTable
DROP TABLE "_subrace_language_choices";

-- DropTable
DROP TABLE "_subrace_languages";

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_traits_AB_unique" ON "_subrace_traits"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_traits_B_index" ON "_subrace_traits"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_trait_choices_AB_unique" ON "_subrace_trait_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_trait_choices_B_index" ON "_subrace_trait_choices"("B");

-- AddForeignKey
ALTER TABLE "_subrace_traits" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_traits" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_trait_choices" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_trait_choices" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;
