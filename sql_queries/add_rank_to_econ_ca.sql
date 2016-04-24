CREATE TABLE schools_econ_rank (
SELECT s.school_name, s.Longitude, s.Latitude, r.coef_rank as coef
FROM schools_econ s
INNER JOIN schools_rank r
ON s.School_Name = r.school_name && s.Location_Zip = r.zip);