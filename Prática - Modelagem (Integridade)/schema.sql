CREATE DATABASE "integrityPractice";

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    "fullName" VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TYPE "customerPhonesTypes" AS ENUM ('landline', 'mobile');

CREATE TABLE "customerPhones" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    number VARCHAR(15) NOT NULL,
    type "customerPhonesTypes" NOT NULL
);

CREATE TABLE "customerAddresses" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(10) NOT NULL,
    complement VARCHAR(50),
    "postalCode" VARCHAR(8) NOT NULL,
    "cityId" INTEGER NOT NULL
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    "stateId" INTEGER NOT NULL
);

CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE "bankAccount" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "accountNumber" VARCHAR(12) NOT NULL,
    agency VARCHAR(5) NOT NULL,
    "openDate" DATE NOT NULL,
    "closeDate" DATE
);

CREATE TYPE "transactionsTypes" AS ENUM ('deposit', 'withdraw');

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    type "transactionsTypes" NOT NULL,
    time TIMESTAMPTZ NOT NULL,
    description VARCHAR(255),
    cancelled BOOLEAN DEFAULT false
);

CREATE TABLE "creditCards" (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    name VARCHAR(40) NOT NULL,
    number VARCHAR(16) NOT NULL,
    "securityCode" VARCHAR(4) NOT NULL,
    "expirationMonth" VARCHAR(2) NOT NULL,
    "expirationYear" VARCHAR(4) NOT NULL,
    password TEXT NOT NULL,
    "limit" INTEGER NOT NULL
 );

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES customers(id);

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES customers(id);
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES cities(id);

ALTER TABLE cities ADD CONSTRAINT cities_fk1 FOREIGN KEY ("stateId") REFERENCES states(id);

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES customers(id);

ALTER TABLE transactions ADD CONSTRAINT transactions_fk0 FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"(id);

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"(id);
