/*
  Warnings:

  - You are about to drop the `Locacao` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Locacao";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Rented" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "dataRetirada" DATETIME NOT NULL,
    "dataDevolucao" DATETIME,
    "carroId" INTEGER NOT NULL,
    "clienteId" INTEGER NOT NULL,
    CONSTRAINT "Rented_carroId_fkey" FOREIGN KEY ("carroId") REFERENCES "Car" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Rented_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "Client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
