CREATE DATABASE travel_agency;

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    acronym TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL
);

CREATE TABLE airports (
    id SERIAL PRIMARY KEY,
    iata_code VARCHAR(3) NOT NULL UNIQUE,
    name TEXT NOT NULL
);

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    number TEXT NOT NULL,
    airport_departure_id INTEGER NOT NULL REFERENCES airports(id),
    airport_arrival_id INTEGER NOT NULL REFERENCES airports(id),
    departs_at TIMESTAMP WITH TIME ZONE NOT NULL,
    arrives_at TIMESTAMP WITH TIME ZONE NOT NULL
);
