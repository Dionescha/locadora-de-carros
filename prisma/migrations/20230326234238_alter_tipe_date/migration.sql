/*
  Warnings:

  - You are about to alter the column `dataDevolucao` on the `Rented` table. The data in that column could be lost. The data in that column will be cast from `String` to `DateTime`.
  - You are about to alter the column `dataRetirada` on the `Rented` table. The data in that column could be lost. The data in that column will be cast from `String` to `DateTime`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Rented" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "dataRetirada" DATETIME NOT NULL,
    "dataDevolucao" DATETIME,
    "carroId" INTEGER NOT NULL,
    "clienteId" INTEGER NOT NULL,
    CONSTRAINT "Rented_carroId_fkey" FOREIGN KEY ("carroId") REFERENCES "Car" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Rented_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "Client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Rented" ("carroId", "clienteId", "dataDevolucao", "dataRetirada", "id") SELECT "carroId", "clienteId", "dataDevolucao", "dataRetirada", "id" FROM "Rented";
DROP TABLE "Rented";
ALTER TABLE "new_Rented" RENAME TO "Rented";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
