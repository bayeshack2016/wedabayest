CREATE TABLE school_az_final2 (
SELECT s.id, s.city, s.Longitude, s.Latitude, s.High_School_Students, s.econ_coef, r.*
FROM schools_econ_az s
INNER JOIN az_school_score r
ON s.name = r.school_name && s.zip = r.zip);
