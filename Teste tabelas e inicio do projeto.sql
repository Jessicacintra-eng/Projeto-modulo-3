USE game_of_thrones;
SELECT * FROM game_of_thrones.`characters_v4`;  
SELECT * FROM game_of_thrones.`got_episodes_v4`;  
SELECT * FROM game_of_thrones.`houses_v1`; 
SELECT * FROM game_of_thrones.`killer_records`;

SELECT 
	`got_screentimes`.`name`, 
    `got_screentimes`.`episodes`,
    `got_screentimes`.`screentime`
FROM 
	`got_screentimes`
WHERE 
	`got_screentimes`.`name` LIKE ("%Daenerys%") OR
    `got_screentimes`.`name` LIKE ("%Cersei%") OR
    `got_screentimes`.`name` LIKE ("%Arya%")
ORDER BY 
	`got_screentimes`.`screentime` DESC;
    
    ## considerando o número total de episódios e seu tempo total, qual a porcentagem de aparição de cada personagem em tempo de tela?
SELECT 
	`got_screentimes`.`name`, 
    `got_screentimes`.`episodes`,
    `got_screentimes`.`screentime`,
	 ROUND(((`got_screentimes`.`screentime`/(SELECT SUM(screentime) FROM got_screentimes))*100),3)  Porcentagem_Total_tempos_de_tela_da_série
FROM 
	`got_screentimes`
ORDER BY 
	`got_screentimes`.`name` DESC;


