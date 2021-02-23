/*
  Warnings:

  - You are about to drop the column `subRaceId` on the `Language` table. All the data in the column will be lost.
  - You are about to drop the column `subRaceId` on the `Trait` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Language" DROP CONSTRAINT "Language_subRaceId_fkey";

-- DropForeignKey
ALTER TABLE "Trait" DROP CONSTRAINT "Trait_subRaceId_fkey";

-- AlterTable
ALTER TABLE "Language" DROP COLUMN "subRaceId";

-- AlterTable
ALTER TABLE "Trait" DROP COLUMN "subRaceId";

-- CreateTable
CREATE TABLE "_subrace_traits" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_subrace_languages" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_traits_AB_unique" ON "_subrace_traits"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_traits_B_index" ON "_subrace_traits"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_languages_AB_unique" ON "_subrace_languages"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_languages_B_index" ON "_subrace_languages"("B");

-- AddForeignKey
ALTER TABLE "_subrace_traits" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_traits" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_languages" ADD FOREIGN KEY ("A") REFERENCES "Language"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_languages" ADD FOREIGN KEY ("B") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;
