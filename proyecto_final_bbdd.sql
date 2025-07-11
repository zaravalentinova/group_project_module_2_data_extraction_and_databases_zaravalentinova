-------------------------------------------------
-- Schema proyecto_grupal_mod_2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `proyecto_grupal_mod_2` ;

-- -----------------------------------------------------
-- Schema proyecto_grupal_mod_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_grupal_mod_2`;
USE `proyecto_grupal_mod_2` ;


-- -----------------------------------------------------
-- Tabla `proyecto_grupal_mod_2`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE,
    biografia TEXT,
    playcount INT,
    oyentes INT,
    similares VARCHAR(255) NULL,
    similares_match_score TEXT
);

-- -----------------------------------------------------
-- Table `proyecto_grupal_mod_2`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    artista VARCHAR(255),
    genero_musical VARCHAR(100),
    tipo VARCHAR(250),
    año_lanzamiento INT,
    id_spotify VARCHAR(100),
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
    );

SELECT * from artistas;