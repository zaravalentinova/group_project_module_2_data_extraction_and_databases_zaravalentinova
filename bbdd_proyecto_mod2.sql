-- Borrar la BDD si existe
DROP DATABASE IF EXISTS proyecto_grupal_mod_2;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS proyecto_grupal_mod_2;
USE proyecto_grupal_mod_2;

-- Tabla de artistas
CREATE TABLE artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE,
    biografia TEXT,
    playcount INT DEFAULT 0,
    oyentes INT DEFAULT 0,
    similares TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de canciones
CREATE TABLE canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    genero_musical VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) DEFAULT 'track',
    año_lanzamiento INT NOT NULL,
    id_spotify VARCHAR(100) UNIQUE NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de relación muchos a muchos entre canciones y artistas
CREATE TABLE canciones_artistas (
    id_relacion INT AUTO_INCREMENT PRIMARY KEY,
    id_cancion INT NOT NULL,
    id_artista INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion) ON DELETE CASCADE,
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista) ON DELETE CASCADE,
    UNIQUE KEY unique_cancion_artista (id_cancion, id_artista)
);

-- Índices para mejorar el rendimiento
CREATE INDEX idx_artistas_nombre ON artistas(nombre);
CREATE INDEX idx_canciones_genero ON canciones(genero_musical);
CREATE INDEX idx_canciones_año ON canciones(año_lanzamiento);
CREATE INDEX idx_canciones_spotify ON canciones(id_spotify);
CREATE INDEX idx_relacion_cancion ON canciones_artistas(id_cancion);
CREATE INDEX idx_relacion_artista ON canciones_artistas(id_artista);




