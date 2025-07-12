DROP SCHEMA IF EXISTS `proyecto_grupal_mod_2` ;

CREATE SCHEMA IF NOT EXISTS `proyecto_grupal_mod_2`;
USE `proyecto_grupal_mod_2` ;

CREATE TABLE IF NOT EXISTS artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE,
    biografia TEXT,
    playcount INT,
    oyentes INT,
    similares VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    artista VARCHAR(255),
    genero_musical VARCHAR(100),
    tipo VARCHAR(250),
    año_lanzamiento INT,
    id_spotify VARCHAR(100) UNIQUE
    );

CREATE TABLE IF NOT EXISTS canciones_artistas (
	id_artista INT,
    id_cancion INT,
    PRIMARY KEY (id_artista, id_cancion),
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM canciones;
SELECT * FROM artistas;
SELECT * FROM canciones_artistas