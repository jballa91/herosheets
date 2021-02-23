/*
  Warnings:

  - You are about to drop the `_SubRaceToTrait` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_SubRaceToTrait" DROP CONSTRAINT "_SubRaceToTrait_A_fkey";

-- DropForeignKey
ALTER TABLE "_SubRaceToTrait" DROP CONSTRAINT "_SubRaceToTrait_B_fkey";

-- CreateTable
CREATE TABLE "_subrace_traits_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- DropTable
DROP TABLE "_SubRaceToTrait";

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_traits_choices_AB_unique" ON "_subrace_traits_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_traits_choices_B_index" ON "_subrace_traits_choices"("B");

-- AddForeignKey
ALTER TABLE "_subrace_traits_choices" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_traits_choices" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;
