-- CreateTable
CREATE TABLE "TableReservation" (
    "id" SERIAL NOT NULL,
    "table" TEXT NOT NULL,
    "chairs_number" INTEGER NOT NULL,
    "is_reserver" BOOLEAN NOT NULL,
    "reserved_date" TIMESTAMP(3) NOT NULL,
    "reserved_hour" TEXT NOT NULL,

    CONSTRAINT "TableReservation_pkey" PRIMARY KEY ("id")
);
