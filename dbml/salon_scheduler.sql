CREATE TABLE "customers" (
  "customer_id" SERIAL PRIMARY KEY,
  "phone" varchar(20) UNIQUE,
  "name" varchar(30) NOT NULL
);

CREATE TABLE "appointments" (
  "appointment_id" SERIAL PRIMARY KEY,
  "service_id" int,
  "customer_id" int NOT NULL,
  "time" varchar(20)
);

CREATE TABLE "services" (
  "service_id" SERIAL PRIMARY KEY,
  "name" varchar(30) NOT NULL
);

ALTER TABLE "appointments" ADD FOREIGN KEY ("service_id") REFERENCES "services" ("service_id");

ALTER TABLE "appointments" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");
