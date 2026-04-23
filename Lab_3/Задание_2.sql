CREATE TABLE IF NOT EXISTS "Client_1" (
	"Id_client" serial NOT NULL UNIQUE,
	"Last_name" varchar(50) NOT NULL,
	"First_name" varchar(50) NOT NULL,
	"Passp_num" varchar(6) NOT NULL UNIQUE,
	"Passp_seria" varchar(4) NOT NULL UNIQUE,
	"TFone" varchar(14) NOT NULL UNIQUE,
	"Adress" varchar(500) NOT NULL,
	PRIMARY KEY ("Id_client")
);

CREATE TABLE IF NOT EXISTS "Client_2" (
	"Id_client" serial NOT NULL UNIQUE,
	"Last_name" varchar(50) NOT NULL,
	"First_name" varchar(50) NOT NULL,
	"Id_client_1" integer NOT NULL,
	"Sv_num" varchar(6) NOT NULL UNIQUE,
	"Sv_date" date NOT NULL UNIQUE,
	PRIMARY KEY ("Id_client")
);

CREATE TABLE IF NOT EXISTS "Book" (
	"Id_book" serial NOT NULL UNIQUE,
	"Name_book" varchar(50) NOT NULL UNIQUE,
	"Last_name" varchar(50) NOT NULL,
	"First_name" varchar(50) NOT NULL,
	"Year_book" date NOT NULL,
	"Type_book" varchar(50) NOT NULL,
	"Name_Isd" varchar(50) NOT NULL,
	"UDK" integer NOT NULL,
	"Count_ekz" bigint NOT NULL,
	PRIMARY KEY ("Id_book")
);

CREATE TABLE IF NOT EXISTS "Book_ekz" (
	"Id_ekz" serial NOT NULL UNIQUE,
	"Id_book" integer NOT NULL UNIQUE,
	"Count_day" bigint NOT NULL,
	"Dep_price" bigint,
	"Day_price" bigint,
	PRIMARY KEY ("Id_ekz")
);

CREATE TABLE IF NOT EXISTS "Service" (
	"Id_service" serial NOT NULL UNIQUE,
	"Name_serv" varchar(50) NOT NULL,
	PRIMARY KEY ("Id_service")
);

CREATE TABLE IF NOT EXISTS "Staff" (
	"Id_staff" serial NOT NULL UNIQUE,
	PRIMARY KEY ("Id_staff")
);

CREATE TABLE IF NOT EXISTS "Service_log" (
	"Id_Slog" serial NOT NULL UNIQUE,
	"Id_service" integer NOT NULL UNIQUE,
	"Id_staff" bigint NOT NULL UNIQUE,
	"Id_client_1" integer NOT NULL UNIQUE,
	"Id_client_2" integer NOT NULL UNIQUE,
	"Id_ekz" bigint NOT NULL UNIQUE,
	"Date_vd" date NOT NULL,
	"Date_pvz" date NOT NULL,
	"Date_vz" date NOT NULL,
	"Metka" boolean NOT NULL,
	PRIMARY KEY ("Id_Slog")
);

CREATE TABLE IF NOT EXISTS "Payment_log" (
	"Id_Plog" serial NOT NULL UNIQUE,
	"Id_Slog" integer NOT NULL UNIQUE,
	"Id_staff" integer NOT NULL UNIQUE,
	"Metka" boolean NOT NULL,
	"Date_pay" date NOT NULL,
	"Pay" bigint NOT NULL,
	PRIMARY KEY ("Id_Plog")
);

CREATE TABLE IF NOT EXISTS "Notice" (
	"Id_note" serial NOT NULL UNIQUE,
	"Id_staff" integer NOT NULL UNIQUE,
	"Id_client" integer NOT NULL UNIQUE,
	"Date_note" date NOT NULL,
	"Text_note" varchar(500) NOT NULL,
	PRIMARY KEY ("Id_note")
);


ALTER TABLE "Client_2" ADD CONSTRAINT "Client_2_fk3" FOREIGN KEY ("Id_client_1") REFERENCES "Client_1"("Id_client");

ALTER TABLE "Book_ekz" ADD CONSTRAINT "Book_ekz_fk1" FOREIGN KEY ("Id_book") REFERENCES "Book"("Id_book");


ALTER TABLE "Service_log" ADD CONSTRAINT "Service_log_fk1" FOREIGN KEY ("Id_service") REFERENCES "Service"("Id_service");

ALTER TABLE "Service_log" ADD CONSTRAINT "Service_log_fk2" FOREIGN KEY ("Id_staff") REFERENCES "Staff"("Id_staff");

ALTER TABLE "Service_log" ADD CONSTRAINT "Service_log_fk3" FOREIGN KEY ("Id_client_1") REFERENCES "Client_1"("Id_client");

ALTER TABLE "Service_log" ADD CONSTRAINT "Service_log_fk4" FOREIGN KEY ("Id_client_2") REFERENCES "Client_2"("Id_client");

ALTER TABLE "Service_log" ADD CONSTRAINT "Service_log_fk5" FOREIGN KEY ("Id_ekz") REFERENCES "Book_ekz"("Id_ekz");
ALTER TABLE "Payment_log" ADD CONSTRAINT "Payment_log_fk1" FOREIGN KEY ("Id_Slog") REFERENCES "Service_log"("Id_Slog");

ALTER TABLE "Payment_log" ADD CONSTRAINT "Payment_log_fk2" FOREIGN KEY ("Id_staff") REFERENCES "Staff"("Id_staff");
ALTER TABLE "Notice" ADD CONSTRAINT "Notice_fk1" FOREIGN KEY ("Id_staff") REFERENCES "Staff"("Id_staff");

ALTER TABLE "Notice" ADD CONSTRAINT "Notice_fk2" FOREIGN KEY ("Id_client") REFERENCES "Client_1"("Id_client");