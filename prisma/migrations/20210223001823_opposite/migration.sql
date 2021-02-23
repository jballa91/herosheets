/*
  Warnings:

  - You are about to drop the `_subrace_languages` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_subrace_traits` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_subrace_languages" DROP CONSTRAINT "_subrace_languages_A_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_languages" DROP CONSTRAINT "_subrace_languages_B_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_traits" DROP CONSTRAINT "_subrace_traits_A_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_traits" DROP CONSTRAINT "_subrace_traits_B_fkey";

-- CreateTable
CREATE TABLE "_subrace_trait_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_subrace_language_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- DropTable
DROP TABLE "_subrace_languages";

-- DropTable
DROP TABLE "_subrace_traits";

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_trait_choices_AB_unique" ON "_subrace_trait_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_trait_choices_B_index" ON "_subrace_trait_choices"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_language_choices_AB_unique" ON "_subrace_language_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_language_choices_B_index" ON "_subrace_language_choices"("B");

-- AddForeignKey
ALTER TABLE "_subrace_trait_choices" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_trait_choices" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_language_choices" ADD FOREIGN KEY ("A") REFERENCES "Language"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_language_choices" ADD FOREIGN KEY ("B") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;
