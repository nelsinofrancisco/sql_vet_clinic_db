/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '20160101' AND '20190101';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth as "Date of Birth" FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts as "Escape attempts" FROM animals WHERE weigth_kg > 10.5;
SELECT *  FROM animals WHERE neutered IS true;
SELECT *  FROM animals WHERE name NOT IN ('Gabumon');
SELECT *  FROM animals WHERE weigth_kg BETWEEN 10.4 and 17.3;

BEGIN;

UPDATE animals
SET species = 'unspecified';

SELECT 
  *
FROM animals;

ROLLBACK;

SELECT 
  *
FROM animals;

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

SELECT 
  *
FROM animals;

COMMIT;

SELECT 
  *
FROM animals;

BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT 
  *
FROM animals;

DELETE FROM animals
WHERE date_of_birth > '20220101';

BEGIN;

SAVEPOINT SP1;

UPDATE animals
SET weigth_kg = weigth_kg * -1;

ROLLBACK;

BEGIN;

UPDATE animals
SET weigth_kg = weigth_kg * -1
WHERE weigth_kg < 0;

COMMIT;

SELECT 
  * 
FROM animals;

SELECT 
  COUNT(*) as "Animals"
FROM animals;

SELECT 
  COUNT(*) as "Animals"
FROM animals
WHERE escape_attempts = 0;

SELECT 
  AVG(weigth_kg) as "Average weigth of Animals"
FROM animals;

SELECT 
  neutered, SUM(escape_attempts) as "Escape Attempts"
FROM animals
GROUP BY neutered;

SELECT 
  species as "Species", MIN(weigth_kg) as "Min Weight", MAX(weigth_kg) as "Max Weight"
FROM animals
GROUP BY species;

SELECT 
  species as "Species", AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '19900101' and '20000101'
GROUP BY species;

