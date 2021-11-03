DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name varchar(80) NOT NULL,
  age INT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(80) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(80) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts INT,
    neutered boolean NOT NULL,
    weigth_kg float NOT NULL,
    species_id INT,
    owner_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_species
      FOREIGN KEY(species_id)
        REFERENCES species(id)
          ON DELETE CASCADE,
    CONSTRAINT fk_owners
      FOREIGN KEY(owner_id)
        REFERENCES owners(id)
          ON DELETE CASCADE
);