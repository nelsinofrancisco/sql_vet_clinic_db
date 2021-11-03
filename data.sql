/* Populate database with sample data. */

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name) VALUES ('Pokemon'),
('Digimon');

INSERT INTO 
  animals(name, date_of_birth, escape_attempts, neutered, weigth_kg) 
VALUES ('Agumon', '20200203', 0, true, 10.23 ),
('Gabumon', '20181115', 2, true, 8 ),
('Pikachu', '20210107', 1, false, 15.04 ),
('Devimon', '20170512', 5, true, 11 ),
('Charmander', '20200208', 0, false, 11 ),
('Plantmon', '20221115', 2, true, 5.7 ),
('Squirtle', '19930402', 3, false, 12.13 ),
('Angemon', '20050612', 1, true, 45 ),
('Boarmon', '20050607', 7, true, 20.4 ),
('Blossom', '19981013', 3, true, 17 );

BEGIN;
UPDATE animals
SET species_id = (SELECT sp.id FROM species sp WHERE sp.name LIKE '%mon');
COMMIT;

BEGIN;
UPDATE animals
SET species_id = (SELECT sp.id FROM species sp WHERE sp.name NOT LIKE '%mon');
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon'  OR name = 'Boarmon';
COMMIT;
