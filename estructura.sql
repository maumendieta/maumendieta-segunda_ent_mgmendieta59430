DROP DATABASE IF EXISTS liqui_escuela;
CREATE DATABASE liqui_escuela;
USE liqui_escuela;

DROP DATABASE IF EXISTS liqui_escuela;
CREATE DATABASE liqui_escuela;
USE liqui_escuela;

-- *********************************
-- TABLAS SIN FORENGN KEY
-- *********************************

CREATE TABLE escuela(
        id_escuela INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       nombre VARCHAR(200)
,		numero INT UNIQUE
,		categoria ENUM('CAT1','CAT2','CAT3') 
,		ciudad VARCHAR(200)
,		nivel ENUM('PRIMARIA','SECUNDARIA','SUPERIOR')
);

CREATE TABLE tipo_cargo(
        id_tipo_cargo INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       tipo_cargo VARCHAR(200)
);

CREATE TABLE area(
        id_area INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       area_escuela VARCHAR(200)
);

CREATE TABLE sit_revista(
        id_sit_revista INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       situacion_revista VARCHAR(200)
); 

CREATE TABLE banco(
        id_banco INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       nombre_banco VARCHAR(200)
);

CREATE TABLE empleado(
        id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       id_banco INT
,		nombre VARCHAR(200)
,       dni INT
,       fecha_nacimiento DATE
,       fecha_ingreso DATE
,		fecha_baja DATE
, 		sucursal_banco INT
,		cuenta_banco INT
, 		agremiado ENUM('SI','NO')
);
-- AGREGADO DE COLUMNA POR FUNCIONALIDAD DE PROCEDIMIENTOS
ALTER TABLE liqui_escuela.empleado
ADD COLUMN observaciones VARCHAR(200);

-- *********************************
-- TABLAS CON FORENGN KEY
-- *********************************

CREATE TABLE cargo(
        id_cargo INT NOT NULL UNIQUE PRIMARY KEY
,       id_escuela INT
,		id_tipo_cargo INT
,		id_area INT
,       denominacion VARCHAR(200)
,       horas INT
,       turno VARCHAR(200)
,		puntaje DECIMAL(10,4)
);

CREATE TABLE asistencia(
        id_asistencia DATE NOT NULL PRIMARY KEY
,       id_empleado INT
,       asistencia ENUM('PRESENTE','AUSENTE') DEFAULT('PRESENTE')
,       desc_dias INT DEFAULT(0)
,       desc_hs INT DEFAULT(0)
);

CREATE TABLE emp_cargo(
        id_emp_cargo INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       id_empleado INT
,       id_cargo INT
,       id_sit_revista INT
,       ftp_cgo DATE
,       horas_cargo INT  
,       antiguedad_años INT
,       antiguedad_meses INT
);

CREATE TABLE cod_empleado(
        id_cod_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       id_emp_cargo INT
, 	id_indice INT
, 	id_sueldo INT
,       calculo INT
,       referencia INT
);

CREATE TABLE sueldo(
        id_sueldo INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,       id_banco INT
,       monto DECIMAL(10,2)
,       fecha_deposito DATE
);

CREATE TABLE indice(
		id_indice INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,		id_cod_empleado INT
,		valor_indice DECIMAL(10,4)
);

-- *********************************
-- DECLARACION DE FOREING KEY
-- *********************************

-- CARGO
ALTER TABLE
        cargo 
        ADD CONSTRAINT fk_constraint_id_escuela
        FOREIGN KEY
        (id_escuela) REFERENCES escuela(id_escuela);        
        ALTER TABLE
        cargo 
        ADD CONSTRAINT fk_constraint_id_tipo_cargo
        FOREIGN KEY
        (id_tipo_cargo) REFERENCES tipo_cargo(id_tipo_cargo);
        ALTER TABLE
        cargo 
        ADD CONSTRAINT fk_constraint_id_area
        FOREIGN KEY
        (id_area) REFERENCES area(id_area);
        
-- ASISTENCIA
ALTER TABLE
        asistencia
        ADD CONSTRAINT fk_constraint_id_emp_asist
        FOREIGN KEY
        (id_empleado) REFERENCES empleado(id_empleado);

-- EMPLEADO_CARGO
ALTER TABLE
        emp_cargo
        ADD CONSTRAINT fk_constraint_id_emp_cargo
        FOREIGN KEY
        (id_empleado) REFERENCES empleado(id_empleado);
ALTER TABLE
        emp_cargo
        ADD CONSTRAINT fk_constraint_id_cargo_emp
        FOREIGN KEY
        (id_cargo) REFERENCES cargo(id_cargo);
ALTER TABLE
        emp_cargo
        ADD CONSTRAINT fk_constraint_id_sr_cargo
        FOREIGN KEY
        (id_sit_revista) REFERENCES sit_revista(id_sit_revista);

-- codigo_empleado
ALTER TABLE
        cod_empleado
        ADD CONSTRAINT fk_constraint_id_emp_cargo_cod
        FOREIGN KEY
        (id_emp_cargo) REFERENCES emp_cargo(id_emp_cargo);    
        ALTER TABLE
        cod_empleado
        ADD CONSTRAINT fk_constraint_id_sueldo
        FOREIGN KEY
        (id_sueldo) REFERENCES sueldo(id_sueldo);

-- indice
ALTER TABLE
        indice
        ADD CONSTRAINT fk_constraint_cod_empleado
        FOREIGN KEY
        (id_cod_empleado) REFERENCES cod_empleado(id_cod_empleado);

-- sueldo    
ALTER TABLE
        sueldo
        ADD CONSTRAINT fk_constraint_id_banco
        FOREIGN KEY
        (id_banco) REFERENCES banco(id_banco);

