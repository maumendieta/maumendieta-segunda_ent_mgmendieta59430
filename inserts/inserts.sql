USE liqui_escuela;

-- INSERTS PARA TABLAS

-- inserción en TABLA ESCUELA
INSERT INTO liqui_escuela.escuela
(nombre, numero, categoria, ciudad, nivel) VALUES
('san justo',2698,1,'rosario',1),
('obraje',6589,2,'galvez',2),
('tecnica',4986,1,'rosario',2),
('patricios',5846,3,'rosario',3),
('superior',1236,2,'rosario',1),
('contable',7789,1,'perez',2);

-- inserción en TABLA TIPO_CARGO
INSERT INTO liqui_escuela.tipo_cargo
(id_tipo_cargo, tipo_cargo) VALUES
(1,'cat'),
(2,'cgo');

-- inserción en TABLA AREA
INSERT INTO liqui_escuela.area
(id_area, area_escuela) VALUES
(1;'docentes'),
(2,'asistentes'),
(3,'maestranza');

-- inserción en TABLA SIT_REVISTA
INSERT INTO liqui_escuela.sit_revista 
(id_sit_revista, situacion_revista) VALUES
(1,'titular'),
(3, 'reemplazante'),
(9, 'titular a termino'),
(99, 'tareas diferentes');

-- inserción en TABLA BANCO
INSERT INTO liqui_escuela.
(id_banco, nombre_banco) VALUES
(1, 'industrial'),
(2, 'forestal');

-- inserción en TABLA EMPLEADO (modificación de tabla por mejora de datos - se agrega columna apellido y se ordena)
ALTER TABLE liqui_escuela.empleado
ADD COLUMN apellido VARCHAR (200); 
ALTER TABLE liqui_escuela.empleado
MODIFY apellido VARCHAR(200) AFTER  nombre,
MODIFY COLUMN agremiado BOOLEAN;
-- INSERT REALIZADO VIA IMPORTACIÓN DE CSV (empleado.csv) 1000 empleados

-- *********************************
-- TABLAS CON FORENGN KEY
-- *********************************

-- inserción TABLA CARGO
-- INSERT REALIZADO VIA IMPORTACIÓN DE CSV (cargos.csv) 112 registros generado con Excel > CSV


-- insert TABLA ASISTENCIA
-- generé un listado de asistencia para 20 empleados por el mes de NOVIEMBRE 2024 completo en formato CSV con CHAT GPT
-- se inserta por importación


-- inserción en TABLA EMP_CARGO (modificación de tabla por repetición de datos - horas cargo)
ALTER TABLE liqui_escuela.emp_cargo
DELETE COLUMN horas_cargo INT;
-- UNA VEZ BORRADA LA COLUMNA se genera dataset con Mockaroo 100 registros y se importa CSV en Workbench


-- inserción en TABLA COD_EMPLEADO 
-- se insertará en avance del curso. Depende de la liquidación

-- inserción en cod_empleado 
-- se insertará en avance del curso. Depende de la liquidación

-- inserción en TABLA INDICE (modificación de tabla por falta de datos: columna agregada ind_nombre, mes, anio)
ALTER TABLE liqui_escuela.indice
ADD COLUMN ind_nombre VARCHAR (200);
ALTER TABLE liqui_escuela.indice
MODIFY ind_nombre VARCHAR(200) AFTER  id_indice;
ALTER TABLE liqui_escuela.indice
ADD COLUMN mes (INT), 
ADD COLUMN anio (INT);


INSERT INTO liqui_escuela.indice
(ind_nombre,valor_indice, mes, anio) VALUES
('basico',384,11,2024),
('antiguedad',null,11,2024),
('complemento basico',500,11,2024);

