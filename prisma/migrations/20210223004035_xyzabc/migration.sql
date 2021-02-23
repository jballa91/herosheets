-- DropForeignKey
ALTER TABLE "_ABC" DROP CONSTRAINT "_ABC_A_fkey";

-- DropForeignKey
ALTER TABLE "_ABC" DROP CONSTRAINT "_ABC_B_fkey";

-- DropForeignKey
ALTER TABLE "_xyz" DROP CONSTRAINT "_xyz_A_fkey";

-- DropForeignKey
ALTER TABLE "_xyz" DROP CONSTRAINT "_xyz_B_fkey";

-- AddForeignKey
ALTER TABLE "_ABC" ADD FOREIGN KEY ("A") REFERENCES "Language"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ABC" ADD FOREIGN KEY ("B") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_xyz" ADD FOREIGN KEY ("A") REFERENCES "Language"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_xyz" ADD FOREIGN KEY ("B") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;
