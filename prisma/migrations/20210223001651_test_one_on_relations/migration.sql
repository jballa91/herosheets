/*
  Warnings:

  - You are about to drop the `_subrace_language_choices` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_subrace_trait_choices` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_subrace_language_choices" DROP CONSTRAINT "_subrace_language_choices_A_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_language_choices" DROP CONSTRAINT "_subrace_language_choices_B_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_trait_choices" DROP CONSTRAINT "_subrace_trait_choices_A_fkey";

-- DropForeignKey
ALTER TABLE "_subrace_trait_choices" DROP CONSTRAINT "_subrace_trait_choices_B_fkey";

-- AlterTable
ALTER TABLE "Language" ADD COLUMN     "subRaceId" INTEGER;

-- AlterTable
ALTER TABLE "Trait" ADD COLUMN     "subRaceId" INTEGER;

-- DropTable
DROP TABLE "_subrace_language_choices";

-- DropTable
DROP TABLE "_subrace_trait_choices";

-- AddForeignKey
ALTER TABLE "Language" ADD FOREIGN KEY ("subRaceId") REFERENCES "SubRace"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trait" ADD FOREIGN KEY ("subRaceId") REFERENCES "SubRace"("id") ON DELETE SET NULL ON UPDATE CASCADE;
