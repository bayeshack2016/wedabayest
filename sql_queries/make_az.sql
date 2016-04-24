CREATE TABLE school_az(
SELECT s.School_Name as name,
s.Location_Zip as Zip,
s.Location_City as city,
s.Longitude, 
s.Latitude,
s.High_School_Students 
FROM Schools s 
WHERE s.State_Name = "Arizona"
&& s.High_School_Students > 20);