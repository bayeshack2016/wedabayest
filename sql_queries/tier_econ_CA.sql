CREATE TABLE schools_econ_1 (
SELECT *
FROM schools_econ s
ORDER BY s.coef DESC
LIMIT 370
);
CREATE TABLE schools_econ_2 (
SELECT *
FROM schools_econ s
WHERE s.coef < (SELECT min(sc1.coef) FROM schools_econ_1 sc1)
ORDER BY s.coef DESC
LIMIT 370
);
CREATE TABLE schools_econ_3 (
SELECT *
FROM schools_econ s
WHERE s.coef < (SELECT min(sc2.coef) FROM schools_econ_2 sc2)
ORDER BY s.coef DESC
LIMIT 370
);
CREATE TABLE schools_econ_4 (
SELECT *
FROM schools_econ s
WHERE s.coef < (SELECT min(sc3.coef) FROM schools_econ_3 sc3)
ORDER BY s.coef DESC
LIMIT 370
);
CREATE TABLE schools_econ_5 (
SELECT *
FROM schools_econ s
WHERE s.coef < (SELECT min(sc4.coef) FROM schools_econ_4 sc4)
ORDER BY s.coef DESC
);
ALTER TABLE schools_econ_1 DROP COLUMN coef;
ALTER TABLE schools_econ_2 DROP COLUMN coef;
ALTER TABLE schools_econ_3 DROP COLUMN coef;
ALTER TABLE schools_econ_4 DROP COLUMN coef;
ALTER TABLE schools_econ_5 DROP COLUMN coef;
