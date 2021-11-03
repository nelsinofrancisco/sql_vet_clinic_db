SELECT full_name as "Owner", name as "Animal Name"
FROM animals
JOIN owners
ON animals.owner_id = owners.id;

SELECT species.name as "Species", animals.name as "Animal"
FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT full_name as "Owner", name as "Animal Name"
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

SELECT species.name as "Species", COUNT(animals.name) as "Number of Animals"
FROM species
JOIN animals
ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name as "Animal Name", owners.full_name as "Owner"
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell';

SELECT animals.name as "Animal Name", owners.full_name as "Owner"
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0; 

SELECT owners.full_name as "Owners", COUNT(animals.name) as "Number of Animals"
FROM owners
JOIN animals
ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY "Number of Animals" DESC LIMIT 1;