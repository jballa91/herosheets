/*
  Warnings:

  - You are about to drop the `_language_choices` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_languages` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_language_choices" DROP CONSTRAINT "_language_choices_A_fkey";

-- DropForeignKey
ALTER TABLE "_language_choices" DROP CONSTRAINT "_language_choices_B_fkey";

-- DropForeignKey
ALTER TABLE "_languages" DROP CONSTRAINT "_languages_A_fkey";

-- DropForeignKey
ALTER TABLE "_languages" DROP CONSTRAINT "_languages_B_fkey";

-- CreateTable
CREATE TABLE "_subrace_languages" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_subrace_language_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- DropTable
DROP TABLE "_language_choices";

-- DropTable
DROP TABLE "_languages";

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_languages_AB_unique" ON "_subrace_languages"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_languages_B_index" ON "_subrace_languages"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_language_choices_AB_unique" ON "_subrace_language_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_language_choices_B_index" ON "_subrace_language_choices"("B");

-- AddForeignKey
ALTER TABLE "_subrace_languages" ADD FOREIGN KEY ("A") REFERENCES "Language"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_languages" ADD FOREIGN KEY ("B") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_language_choices" ADD FOREIGN KEY ("A") REFERENCES "Language"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_language_choices" ADD FOREIGN KEY ("B") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;
