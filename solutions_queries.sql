# First Query
SELECT COUNT(*)
FROM visits
where animal_id = 4;

# Solution for first query
CREATE INDEX animals_visits_id ON visits(animal_id ASC);

# Second Query
SELECT * FROM visits where vet_id = 2;

# Solution for second query
CREATE INDEX visits_vet_id ON visits(vet_id ASC);


# Third Query
SELECT * FROM owners where email = 'owner_18327@mail.com';

# Solution for third query
CREATE INDEX owners_email_index ON visits(email_id ASC);



