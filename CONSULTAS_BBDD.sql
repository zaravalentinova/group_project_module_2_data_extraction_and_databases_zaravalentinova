-- Consultas SQL para Base de Datos Musical


-- Top 10 artistas más populares

SELECT nombre, playcount 
FROM artistas 
ORDER BY playcount DESC 
LIMIT 10;


-- Distribución de canciones por género y año

SELECT genero_musical, año_lanzamiento, COUNT(*) AS total_canciones
FROM canciones
GROUP BY genero_musical, año_lanzamiento;



-- Búsqueda de canciones por palabra clave

SELECT c.nombre, a.nombre AS artista
FROM canciones c
JOIN canciones_artistas ca ON c.id_cancion = ca.id_cancion
JOIN artistas a ON ca.id_artista = a.id_artista
WHERE c.nombre LIKE '%amor%';

-- Artistas sin canciones registradas

SELECT nombre
FROM artistas
WHERE id_artista NOT IN (SELECT id_artista FROM canciones_artistas);


--  Top 5 artistas más productivos

SELECT a.nombre, COUNT(ca.id_cancion) AS total_canciones
FROM artistas a
JOIN canciones_artistas ca ON a.id_artista = ca.id_artista
GROUP BY a.id_artista
ORDER BY total_canciones DESC
LIMIT 5;

--  Canciones de artistas similares

SELECT c.nombre, a.nombre AS artista
FROM canciones c
JOIN canciones_artistas ca ON c.id_cancion = ca.id_cancion
JOIN artistas a ON ca.id_artista = a.id_artista
WHERE a.similares LIKE '%Rock%';




--  Géneros con artistas más populares

SELECT 
    c.genero_musical,
    AVG(a.playcount) AS avg_playcount,
    SUM(a.oyentes) AS total_oyentes
FROM canciones c
JOIN canciones_artistas ca ON c.id_cancion = ca.id_cancion
JOIN artistas a ON ca.id_artista = a.id_artista
GROUP BY c.genero_musical
ORDER BY avg_playcount DESC;

-- Detección de duplicados en Spotify

SELECT id_spotify, COUNT(*) AS duplicados
FROM canciones
GROUP BY id_spotify
HAVING COUNT(*) > 1;

--  Últimos lanzamientos por artista

SELECT 
    a.nombre AS artista,
    MAX(c.año_lanzamiento) AS ultimo_lanzamiento,
    GROUP_CONCAT(c.nombre SEPARATOR ' | ') AS canciones
FROM artistas a
JOIN canciones_artistas ca ON a.id_artista = ca.id_artista
JOIN canciones c ON ca.id_cancion = c.id_cancion
GROUP BY a.id_artista;

--  Artistas con biografía completa

SELECT nombre, LENGTH(biografia) AS longitud_biografia
FROM artistas
WHERE LENGTH(biografia) > 500
ORDER BY longitud_biografia DESC;


-- Relación oyentes/playcount

SELECT 
    nombre,
    oyentes,
    playcount,
    ROUND(playcount/oyentes, 2) AS ratio_engagement
FROM artistas
WHERE oyentes > 100000
ORDER BY ratio_engagement DESC;

-- Canciones por artista por año

SELECT 
    a.nombre AS artista,
    c.año_lanzamiento,
    COUNT(*) AS canciones
FROM artistas a
JOIN canciones_artistas ca ON a.id_artista = ca.id_artista
JOIN canciones c ON ca.id_cancion = c.id_cancion
GROUP BY a.id_artista, c.año_lanzamiento
ORDER BY a.nombre, c.año_lanzamiento DESC;


-- Popularidad de artistas por año

SELECT 
    c.año_lanzamiento,
    a.nombre,
    SUM(a.playcount) AS total_playcount
FROM artistas a
JOIN canciones_artistas ca ON a.id_artista = ca.id_artista
JOIN canciones c ON ca.id_cancion = c.id_cancion
GROUP BY c.año_lanzamiento, a.id_artista
ORDER BY c.año_lanzamiento DESC, total_playcount DESC;






