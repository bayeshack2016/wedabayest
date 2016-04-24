SELECT f.*
FROM final_az f
INTO OUTFILE '/home/bayes/output/YelpWithSchool_AZ.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';