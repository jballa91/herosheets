/*
  Warnings:

  - You are about to drop the `_ABC` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_xyz` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ABC" DROP CONSTRAINT "_ABC_A_fkey";

-- DropForeignKey
ALTER TABLE "_ABC" DROP CONSTRAINT "_ABC_B_fkey";

-- DropForeignKey
ALTER TABLE "_xyz" DROP CONSTRAINT "_xyz_A_fkey";

-- DropForeignKey
ALTER TABLE "_xyz" DROP CONSTRAINT "_xyz_B_fkey";

-- DropTable
DROP TABLE "_ABC";

-- DropTable
DROP TABLE "_xyz";
