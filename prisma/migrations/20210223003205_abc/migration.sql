/*
  Warnings:

  - You are about to drop the `_subrace_trait_choices` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_subrace_trait_choices" DROP CONSTRAINT "_subrace_trait_choices_A_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_trait_choices" DROP CONSTRAINT "_subrace_trait_choices_B_fkey";

-- CreateTable
CREATE TABLE "_ABC" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- DropTable
DROP TABLE "_subrace_trait_choices";

-- CreateIndex
CREATE UNIQUE INDEX "_ABC_AB_unique" ON "_ABC"("A", "B");

-- CreateIndex
CREATE INDEX "_ABC_B_index" ON "_ABC"("B");

-- AddForeignKey
ALTER TABLE "_ABC" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ABC" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;
