CREATE TYPE estado_espacio AS ENUM ('ocupado', 'libre');

--TABLA CLIENTE
CREATE TABLE clientes (
    id_client SERIAL PRIMARY KEY,
    nombre VARCHAR(45), 
    telefono VARCHAR(20),
    email VARCHAR(20)
);

-- 3. Tabla empleados
CREATE TABLE empleados (
    id_emp SERIAL PRIMARY KEY,
    nombre_emp VARCHAR(45),
    apellido_emp VARCHAR(45),
    telefono_emp VARCHAR(25)
);

-- Tabla vehiculo 
CREATE TABLE vehiculo (
    id_vehiculo SERIAL PRIMARY KEY, 
    matricula VARCHAR(20) NOT NULL UNIQUE,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES clientes(id_client)
);

--ESPACIO
CREATE TABLE espacios (
    id_espacio SERIAL PRIMARY KEY,
    estado estado_espacio DEFAULT 'libre',
    id_vehiculo INT NULL UNIQUE,
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo)
);



-- TABLA RELACION  CLIENTE-EMPLEADO
CREATE TABLE relacioncli (
    id_relacion SERIAL PRIMARY KEY,
    id_client INT,
    id_emp INT,
    FOREIGN KEY (id_client) REFERENCES clientes(id_client),
    FOREIGN KEY (id_emp) REFERENCES empleados(id_emp)
);
--TABLA REGISTRO DE MANTENIMIENTO
CREATE TABLE mantenimiento(
    id_mantenimiento SERIAL PRIMARY KEY,
    id_espacio      INT, 
    id_emp          INT,
    fecha           DATE,
    FOREIGN KEY (id_espacio) REFERENCES espacios(id_espacio),
    FOREIGN KEY (id_emp) REFERENCES empleados(id_emp)
);