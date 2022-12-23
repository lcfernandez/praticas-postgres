CREATE DATABASE rental;

CREATE TABLE clients (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE phones (
    id SERIAL NOT NULL PRIMARY KEY,
    number VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE clients_phones (
    id SERIAL NOT NULL PRIMARY KEY,
    client_id INTEGER NOT NULL REFERENCES clients(id),
    phone_id INTEGER NOT NULL REFERENCES phones(id)
);

CREATE TABLE states (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    state_id INTEGER NOT NULL REFERENCES states(id)
);

CREATE TABLE addresses (
    id SERIAL NOT NULL PRIMARY KEY,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT,
    district TEXT NOT NULL,
    postal_code VARCHAR(8) NOT NULL,
    city_id INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE clients_id (
    id SERIAL NOT NULL PRIMARY KEY,
    client_id INTEGER NOT NULL REFERENCES clients(id) UNIQUE,
    address_id INTEGER NOT NULL REFERENCES addresses(id)
);

CREATE TABLE categories (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE movies (
    id SERIAL NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    category_id INTEGER NOT NULL REFERENCES categories(id)
);

CREATE TABLE countries (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE actors (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries(id),
    birth_date DATE NOT NULL
);

CREATE TABLE movies_actors (
    id SERIAL NOT NULL PRIMARY KEY,
    movie_id INTEGER NOT NULL REFERENCES movies(id),
    actor_id INTEGER NOT NULL REFERENCES actors(id)
);

CREATE TABLE movies_rates (
    id SERIAL NOT NULL PRIMARY KEY,
    movie_id INTEGER NOT NULL REFERENCES movies(id),
    client_id INTEGER NOT NULL REFERENCES clients(id),
    rate INTEGER NOT NULL CHECK (rate >= 0 AND rate <= 10)
);

CREATE TABLE rentals (
    id SERIAL NOT NULL PRIMARY KEY,
    client_id INTEGER NOT NULL REFERENCES clients(id),
    pickup_date DATE NOT NULL DEFAULT NOW(),
    return_date DATE,
    service_rate INTEGER CHECK (service_rate >= 0 AND service_rate <= 10)
);

CREATE TABLE discs (
    id SERIAL NOT NULL PRIMARY KEY,
    number TEXT NOT NULL UNIQUE,
    barcode TEXT NOT NULL,
    movie_id INTEGER NOT NULL REFERENCES movies(id)
);

CREATE TABLE rentals_discs (
    id SERIAL NOT NULL PRIMARY KEY,
    rent_id INTEGER NOT NULL REFERENCES rentals(id),
    disc_id INTEGER NOT NULL REFERENCES discs(id)
);
