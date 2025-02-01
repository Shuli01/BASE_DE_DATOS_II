CREATE DATABASE bd_videojuego;
USE bd_videojuego;

CREATE TABLE usuario (
id_usuario INT PRIMARY KEY auto_increment,
nombre_usuario VARCHAR(15) UNIQUE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
contrasena VARCHAR(100) NOT NULL,
fecha_registro DATE NOT NULL,
ultimo_login DATETIME );

CREATE TABLE personaje (
    id_personaje INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    nivel INT DEFAULT 1,
    experiencia INT DEFAULT 0,
    clase VARCHAR(30),
    vida INT DEFAULT 100,
    mana INT DEFAULT 50,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) );

CREATE TABLE objeto (
    id_objeto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    rareza VARCHAR(20) DEFAULT 'Común',
    valor INT DEFAULT 0,
    efecto TEXT);
    
CREATE TABLE inventario (
    id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_personaje INT NOT NULL,
    id_objeto INT NOT NULL,
    cantidad INT DEFAULT 1,
    FOREIGN KEY (id_personaje) REFERENCES personaje(id_personaje),
    FOREIGN KEY (id_objeto) REFERENCES objeto(id_objeto));
    
    CREATE TABLE logros (
    id_logros INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    puntos INT DEFAULT 10);
    
    CREATE TABLE logro_usuario (
    id_logro_usuario INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_logros INT NOT NULL,
    fecha_desbloqueo DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_logros) REFERENCES logros(id_logros) );

CREATE TABLE nivel (
    id_nivel INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    dificultad VARCHAR(20) DEFAULT 'Normal',
    requisito_nivel INT DEFAULT 1);

CREATE TABLE enemigo (
    id_enemigo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    vida INT NOT NULL,
    daño INT NOT NULL,
    id_nivel INT NOT NULL,
    FOREIGN KEY (id_nivel) REFERENCES nivel(id_nivel));
    
    CREATE TABLE misiones (
    id_misiones INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,	
    descripcion TEXT NOT NULL,
    recompensa INT DEFAULT 100,
    id_nivel INT NOT NULL,
    FOREIGN KEY (id_nivel) REFERENCES Nivel(id_nivel));
    
INSERT INTO usuario  (nombre_usuario, email, contrasena, fecha_registro)
VALUES ('AYWAD25', 'aywadal@gmail.com','mipassword123', CURDATE());

INSERT INTO personaje (id_usuario, nombre, clase, vida)
VALUES (1, 'Shu', 'Arquero', 120);
    
