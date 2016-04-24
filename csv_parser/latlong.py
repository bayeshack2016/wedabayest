import DatabaseHandle

from operator import itemgetter

def distance (lat1,lon1,lat2,lon2):
	from math import sin, cos, sqrt, atan2, radians
	
	# approximate radius of earth in km
	R = 6373.0
	
	lat1 = radians(lat1)
	lon1 = radians(lon1)
	lat2 = radians(lat2)
	lon2 = radians(lon2)
	
	dlon = lon2 - lon1
	dlat = lat2 - lat1
	
	a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
	c = 2 * atan2(sqrt(a), sqrt(1 - a))
	
	distance = R * c
	
	return distance
	
schools = []
query1 = "SELECT `id`,`Latitude` as `lat`,`Longitude` as `long` FROM school_az_final;"
rows = DatabaseHandle.execute_commit(query1)
for row in rows:
	schools.append(row)

lat_long = {}
query2 = "SELECT `id`,`latitude` as `lat`,`longitude` as `long` FROM `yelp` WHERE `state`='AZ';"
rows = DatabaseHandle.execute_commit(query2)
for row in rows:
	for i in schools:
		dist = distance(float(row[1]),float(row[2]),float(i[1]),float(i[2]))
		if(dist<5):
			lat_long[i[0],distance(float(row[1]),float(row[2]),float(i[1]),float(i[2]))] = i[0]
	if(len(lat_long)>0):
		sorted_lat_long = sorted(lat_long, key=itemgetter(1))
		query3 = "UPDATE `yelp` SET `school_key`="+str(sorted_lat_long[0][0])+" WHERE `id`="+str(row[0])+";"
		DatabaseHandle.execute_commit(query3)
	lat_long = {}
	
"""for row in rows:
	distance
	lat_long[(lat,long)sorted(lat_long"""