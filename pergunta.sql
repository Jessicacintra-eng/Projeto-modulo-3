
##Quais foram os personagens que apareceram em mais episódios?
SELECT 
	`got_screentimes`.`name`, `got_screentimes`.`episodes`
FROM 
	`got_screentimes`
ORDER BY 
	`got_screentimes`.`episodes` DESC;
    
##O tempo de tela é proporcional às aparições? 
SELECT 
	`got_screentimes`.`name`, 
    `got_screentimes`.`episodes`,
    `got_screentimes`.`screentime`
FROM 
	`got_screentimes`
ORDER BY 
	`got_screentimes`.`episodes` DESC;

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
