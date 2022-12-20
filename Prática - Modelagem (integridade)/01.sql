
CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL);

CREATE TABLE states(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL);

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    "stateId" INT NOT NULL REFERENCES states(id));

CREATE TABLE customerPhones(
    id SERIAL PRIMARY KEY,
    "customerId" INT NOT NULL REFERENCES customers(id),
    number TEXT NOT NULL,
    type ,
    );

CREATE TABLE customerAddresses(
    id SERIAL PRIMARY KEY,
    "customerId" INT NOT NULL REFERENCES users(id),
    street TEXT NOT NULL,
    "houseNumber" INTEGER NOT NULL,
    complement INTEGER,
    "postalCode" VARCHAR(10) NOT NULL,
    "cityId" TEXT NOT NULL REFERENCES cities(id));

CREATE TABLE bankAccount(
    id SERIAL PRIMARY KEY,
    "customerId" INT NOT NULL REFERENCES customers(id)
    "accountNumber" INT NOT NULL,
    agency INT NOT NULL,
    "openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
    "closeDate" DATE);

CREATE TABLE transactions(
    id SERIAL PRIMARY KEY,
    "banckAccountId" INT NOT NULL REFERENCES "banckAccount"(id),
    amount INT NOT NULL,
    type,
    time TIMESTAMP NOT NULL DEFAULT NOW(),
    description TEXT,
    cancelled BOOLEAN DEFAULT FALSE NOT NULL);

CREATE TABLE creditCards(
    id SERIAL PRIMARY KEY,
    "banckAccountId" INT NOT NULL REFERENCES "banckAccount"(id),
    name TEXT NOT NULL,
    number INTEGER NOT NULL,
    "securityCode" VARCHAR(3) nOT NULL,
    "expirationMonth" VARCHAR(2) NOT NULL,
    "expirationYear" VARCHAR(4) NOT NULL,
    password TEXT NOT NULL,
    limit INTEGER NOT NULL);