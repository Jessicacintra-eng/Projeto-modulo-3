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
