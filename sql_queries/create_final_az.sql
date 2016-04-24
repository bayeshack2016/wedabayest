CREATE TABLE final_az_final (
SELECT y.* , s.*
FROM yelp y
INNER JOIN school_az_final2 s
ON y.school_key = s.sid );
