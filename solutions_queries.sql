# First Query
SELECT COUNT(*) FROM visits where animal_id = 4;

# Solution for first query
CREATE INDEX animal_id_on_visits ON visits (animal_id ASC)


