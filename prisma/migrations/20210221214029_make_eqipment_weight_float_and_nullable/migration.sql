-- AlterTable
ALTER TABLE "Equipment" ALTER COLUMN "weight" DROP NOT NULL,
ALTER COLUMN "weight" SET DATA TYPE DOUBLE PRECISION;
