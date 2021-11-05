DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS vets;

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

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(80) NOT NULL,
  age INT NOT NULL,
  date_of_graduation date NOT NULL,
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

CREATE TABLE specializations(
  specie_id INT NOT NULL,
  vet_id INT NOT NULL,
  CONSTRAINT fk_species
    FOREIGN KEY(specie_id)
      REFERENCES species(id)
        ON DELETE CASCADE,
  CONSTRAINT fk_vets
    FOREIGN KEY(vet_id)
      REFERENCES vets(id)
        ON DELETE CASCADE,
  PRIMARY KEY(specie_id, vet_id)
)

CREATE TABLE visits(
  animal_id INT NOT NULL,
  vet_id INT NOT NULL,
  CONSTRAINT fk_animals
    FOREIGN KEY(animal_id)
      REFERENCES animals(id)
        ON DELETE CASCADE,
  CONSTRAINT fk_vets
    FOREIGN KEY(vet_id)
      REFERENCES vets(id)
        ON DELETE CASCADE,
  PRIMARY KEY(animal_id, vet_id)
);

