-- AlterTable
ALTER TABLE "Trait" ADD COLUMN     "subRaceId" INTEGER;

-- CreateTable
CREATE TABLE "_subrace_traits" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_traits_AB_unique" ON "_subrace_traits"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_traits_B_index" ON "_subrace_traits"("B");

-- AddForeignKey
ALTER TABLE "_subrace_traits" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_traits" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trait" ADD FOREIGN KEY ("subRaceId") REFERENCES "SubRace"("id") ON DELETE SET NULL ON UPDATE CASCADE;
