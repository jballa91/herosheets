-- AlterTable
ALTER TABLE "Language" ADD COLUMN     "subRaceId" INTEGER;

-- AddForeignKey
ALTER TABLE "Language" ADD FOREIGN KEY ("subRaceId") REFERENCES "SubRace"("id") ON DELETE SET NULL ON UPDATE CASCADE;
