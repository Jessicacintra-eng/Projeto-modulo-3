##Qual é a média de pontuação das temporadas? E qual é a temporada mais bem avaliada? E qual a pior avaliada?
SELECT * FROM got.`got_episodes_v4`;  

SELECT 
	season, ROUND((sum(rating)/count(season)),1) as média_da_pontuação
FROM 
	got_episodes_v4
GROUP BY 
	Season;

##Quais são os 10 episódios mais bem avaliados da série? Quem foram os diretores desses episódios? Quais foram as temporadas com mais episódios dessa lista?
SELECT 
     Season, Director, Episode, Rating 
FROM 
	 got.got_episodes_v4
ORDER BY
     Rating desc
LIMIT
     10;

##Quais são os 10 episódios piores avaliados da série? Quem foram os diretores desses episódios? Quais foram as temporadas com mais episódios dessa lista?
SELECT 
     Season, Director, Episode, Rating 
FROM 
	 got.got_episodes_v4
ORDER BY
     Rating 
LIMIT
     10;
     
##Quem foram os 5 diretores que mais dirigiram episódios na série? Seus episódios foram bem avaliados?
SELECT
    Director, count(Episode) as episódios_dirigidos, ROUND((sum(rating)/count(Episode)),1) as média
FROM 
    got.got_episodes_v4
GROUP BY 
    Director
ORDER BY
    episódios_dirigidos desc
LIMIT
    5;

##Quais foram os episódios mais assistidos nos Estados Unidos? 
SELECT
    Season, Episode, US_Viewers
FROM 
    got.got_episodes_v4
ORDER BY 
    US_Viewers desc;

##Qual foi a média de cada temporada?
SELECT 
	season, ROUND((sum(US_Viewers)/count(season)),1) as média_de_espectadores
FROM 
	got_episodes_v4
GROUP BY 
	Season;

##Quais os 5 episódios mais longos da série?
SELECT 
    Season, Episode, Director, Duration
FROM 
    got.got_episodes_v4
ORDER BY 
    Duration desc
LIMIT
    5;




