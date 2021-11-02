/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '20160101' AND '20190101';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth as "Date of Birth" FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts as "Escape attempts" FROM animals WHERE weigth_kg > 10.5;
SELECT *  FROM animals WHERE neutered IS true;
SELECT *  FROM animals WHERE name NOT IN ('Gabumon');
SELECT *  FROM animals WHERE weigth_kg BETWEEN 10.4 and 17.3;
