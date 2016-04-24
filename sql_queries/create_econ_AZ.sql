CREATE TABLE schools_econ_az(SELECT s.*, e.econ_coef FROM school_az s 
INNER JOIN az_econ e ON s.zip = e.zip);