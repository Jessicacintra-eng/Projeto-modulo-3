SELECT * FROM game_of_thrones.houses_v1;

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



