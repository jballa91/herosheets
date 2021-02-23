/*
  Warnings:

  - You are about to drop the `_subrace_traits` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_subrace_traits" DROP CONSTRAINT "_subrace_traits_A_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_traits" DROP CONSTRAINT "_subrace_traits_B_fkey";

-- CreateTable
CREATE TABLE "_SubRaceToTrait" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- DropTable
DROP TABLE "_subrace_traits";

-- CreateIndex
CREATE UNIQUE INDEX "_SubRaceToTrait_AB_unique" ON "_SubRaceToTrait"("A", "B");

-- CreateIndex
CREATE INDEX "_SubRaceToTrait_B_index" ON "_SubRaceToTrait"("B");

-- AddForeignKey
ALTER TABLE "_SubRaceToTrait" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubRaceToTrait" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;
