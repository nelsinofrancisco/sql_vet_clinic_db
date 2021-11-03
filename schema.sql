/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL,
    name varchar NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts INT,
    neutered boolean NOT NULL,
    weigth_kg float NOT NULL,
    species varchar,
    PRIMARY KEY(id)
);
