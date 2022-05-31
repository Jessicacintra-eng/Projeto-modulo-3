#QUAIS FORAM TRÊS OS MAIORES ASSASSINOS DE GAME OF THRONES DE TODAS AS TEMPORADAS?
#OS 5 PRINCIPAIS MÉTODOS DE ASSASSINATOS SÃO:
#QUANTAS MORTES HOUVERAM POR TEMPORADA?
#QUANTAS MORTES HOUVERAM EM CADA EPISÓDIO?
#CONSIDERANDO AS SEGUINTES CASAS: LANNISTER, TARGARYEN, STARK, BARATHEON, GREYJOY 
##QUANTOS ASSASSINATOS ACONTECERAM EM CADA CASA (EM NÚMERO DE VITIMAS) EM TODA A SÉRIE?
##QUANTOS ASSASSINATOS ACONTECERAM EM CADA CASA (EM NÚMERO DE ASSASSINATOS) EM TODA A SÉRIE?
##QUEM SÃO OS MAIORES ASSASSINOS DE CADA CASA ? 


#QUAIS FORAM TRÊS OS MAIORES ASSASSINOS DE GAME OF THRONES DE TODAS AS TEMPORADAS?
CREATE VIEW 
	Podium_of_Killers AS
SELECT 
	`Killer_name`, COUNT(`Killer_name`) AS Número_de_Assassinatos  
FROM 
	game_of_thrones.`killers_data` 
GROUP BY 
	`Killer_name` 
ORDER BY 
	COUNT(`Killer_name`) DESC
LIMIT 
	0,3;
SELECT 
	*
FROM 
	game_of_thrones.Podium_of_Killers; 
    
#OS 5 PRINCIPAIS MÉTODOS DE ASSASSINATOS SÃO:
SELECT 
	`method`, COUNT(`method`) AS Número_de_Assassinatos  
FROM 
	game_of_thrones.`killers_data` 
GROUP BY 
	`method` 
ORDER BY 
	COUNT(`method`) DESC
LIMIT 
	0,5;
#QUANTAS MORTES HOUVERAM POR TEMPORADA?
SELECT 
	`Season`, COUNT(`Killer_name`) AS Número_de_Assassinatos  
FROM 
	game_of_thrones.`killers_data` 
GROUP BY 
	`Season` 
ORDER BY 
	Season ASC;
 ## total de assassinatos 
 SELECT 
	COUNT(`Killer_name`) AS Número_de_Assassinatos  
FROM 
	game_of_thrones.`killers_data` 
ORDER BY 
	Número_de_Assassinatos ASC;

#QUANTAS MORTES HOUVERAM EM CADA EPISÓDIO?
SELECT 
	`Season`,`Episode`, COUNT(`Killer_name`) AS Número_de_Assassinatos  
FROM 
	game_of_thrones.`killers_data` 
GROUP BY 
	`Episode`, `Season` 
ORDER BY 
	Season ASC;

#CONSIDERANDO AS SEGUINTES CASAS: LANNISTER, TARGARYEN, STARK, BARATHEON, GREYJOY 
##QUANTOS ASSASSINATOS ACONTECERAM EM CADA CASA (EM NÚMERO DE ASSASSINATOS) EM TODA A SÉRIE?
SELECT
	*
FROM
	(SELECT 
		CASE
			WHEN `Killer_name` LIKE ('%Stark%') THEN 'STARK'
			WHEN `Killer_name` LIKE ('%Lannister%') THEN 'LANNISTER'
			WHEN `Killer_name` LIKE ('%Greyjoy%') THEN 'GREYJOY'
			WHEN `Killer_name` LIKE ('%Targaryen%') THEN 'TARGARYEN'
			WHEN `Killer_name` LIKE ('%Baratheon%') THEN 'BARATHEON'
			ELSE 'OUTRAS'
		END AS HOUSES,
		COUNT(`Killer_name`) AS Número_de_Assassinatos
	FROM
		game_of_thrones.killers_data
	GROUP BY HOUSES
	ORDER BY Número_de_Assassinatos) AS tabela
WHERE 
	HOUSES NOT LIKE ("OUTRAS");
#CONSIDERANDO AS SEGUINTES CASAS: LANNISTER, TARGARYEN, STARK, BARATHEON, GREYJOY 
##QUANTOS ASSASSINATOS ACONTECERAM EM CADA CASA (EM NÚMERO DE VITIMAS) EM TODA A SÉRIE?
SELECT 
    CASE
        WHEN `Victim` LIKE ('%Stark%') THEN 'STARK'
        WHEN `Victim` LIKE ('%Lannister%') THEN 'LANNISTER'
        WHEN `Victim` LIKE ('%Greyjoy%') THEN 'GREYJOY'
        WHEN `Victim` LIKE ('%Targaryen%') THEN 'TARGARYEN'
        WHEN `Victim` LIKE ('%Baratheon%') THEN 'BARATHEON'
        ELSE 'OUTRAS'
    END AS HOUSES,
    COUNT(`Victim`) AS Número_de_Mortos
FROM
    game_of_thrones.killers_data
GROUP BY HOUSES
ORDER BY Número_de_Mortos;
##QUEM SÃO OS MAIORES ASSASSINOS DE CADA CASA ? 
SELECT 	
	HOUSES, `Killer_name`, MAX(Número_de_Assassinatos)
FROM (
SELECT 
 CASE
        WHEN `Killer_name` LIKE ('%Stark%') THEN 'STARK'
        WHEN `Killer_name` LIKE ('%Lannister%') THEN 'LANNISTER'
        WHEN `Killer_name` LIKE ('%Greyjoy%') THEN 'GREYJOY'
        WHEN `Killer_name` LIKE ('%Targaryen%') THEN 'TARGARYEN'
        WHEN `Killer_name` LIKE ('%Baratheon%') THEN 'BARATHEON'
        ELSE 'OUTRAS'
    END AS HOUSES, `Killer_name`, COUNT(`Killer_name`) AS Número_de_Assassinatos
FROM 
	game_of_thrones.`killers_data`
WHERE
	`Killer_name` like ("%Stark") OR
	`Killer_name` like ("%Lannister") OR
	`Killer_name` like ("%Greyjoy") OR
	`Killer_name` like ("%Targaryen") OR 
    `Killer_name` like ("%Baratheon")
GROUP BY
Killer_name
ORDER BY
Houses DESC, Número_de_Assassinatos DESC) as tabela
GROUP BY 
	HOUSES;
##HOUSES VS HOUSES ? 
SELECT 	
	HOUSES, `Killer_name`, MAX(Número_de_Assassinatos)
FROM (
SELECT 
 CASE
        WHEN `Killer_name` LIKE ('%Stark%') THEN 'STARK'
        WHEN `Killer_name` LIKE ('%Lannister%') THEN 'LANNISTER'
        WHEN `Killer_name` LIKE ('%Greyjoy%') THEN 'GREYJOY'
        WHEN `Killer_name` LIKE ('%Targaryen%') THEN 'TARGARYEN'
        WHEN `Killer_name` LIKE ('%Baratheon%') THEN 'BARATHEON'
        ELSE 'OUTRAS'
    END AS HOUSES, `Killer_name`, COUNT(`Killer_name`) AS Número_de_Assassinatos
FROM 
	game_of_thrones.`killers_data`
WHERE
	`Killer_name` like ("%Stark") OR
	`Killer_name` like ("%Lannister") OR
	`Killer_name` like ("%Greyjoy") OR
	`Killer_name` like ("%Targaryen") OR 
    `Killer_name` like ("%Baratheon")
GROUP BY
Killer_name
ORDER BY
Houses DESC, Número_de_Assassinatos DESC) as tabela
GROUP BY 
	HOUSES;