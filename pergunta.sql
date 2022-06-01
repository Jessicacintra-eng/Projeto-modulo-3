SELECT * FROM game_of_thrones.houses_v1;
#Número de casas por região
SELECT
region, 
count(house_name)
FROM houses_v1
Group by 
region 
HAVING
count(House_name) >= 1 
order by
count(house_name) DESC
