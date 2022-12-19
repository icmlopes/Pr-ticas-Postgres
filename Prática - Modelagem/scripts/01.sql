
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL);

CREATE TABLE addresses(
    id SERIAL PRIMARY KEY,
    userId INT NOT NULL REFERENCES users(id),
    street TEXT NOT NULL,
    houseNumber INTEGER NOT NULL,
    complement INTEGER NOT NULL,
    postalCode INTEGER NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT NOW());

CREATE TABLE types(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL);

CREATE TABLE sizes(
    id SERIAL PRIMARY KEY,
    size TEXT NOT NULL);

CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price INTEGER NOT NULL,
    image TEXT NOT NULL,
    mainImage TEXT NOT NULL,
    stock  INT NOT NULL,
    typeId INT NOT NULL REFERENCES types(id),
    sizeId INT NOT NULL REFERENCES sizes(id));

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    productsId INTEGER NOT NULL REFERENCES products(id),
    usersId INT NOT NULL REFERENCES users(id),
    createdAt TIMESTAMP NOT NULL DEFAULT NOW());