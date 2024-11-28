USE liqui_escuela;

-- VISTA DE EMPLEADOS POR BANCO
CREATE 
	OR REPLACE VIEW 
		liqui_escuela.vw_empleadoxbanco 
        AS
			SELECT
			CONCAT(e.apellido, ', ', e.nombre) AS nombre_completo
			,   e.dni
			,   b.nombre_banco
			,	e.sucursal_banco
			,	e.cuenta_banco
			FROM liqui_escuela.empleado AS e
			LEFT JOIN liqui_escuela.banco as b
			USING (id_banco)
			ORDER BY b.nombre_banco, e.sucursal_banco ASC, nombre_completo;


-- VISTA TOTAL DE HORAS POR EMPLEADO
CREATE 
	OR REPLACE VIEW
		liqui_escuela.vw_horasxemp AS
			SELECT 
				CONCAT(e.apellido, ', ', e.nombre) AS nombre_completo
			, 	SUM(c.horas) AS total_hs
			FROM liqui_escuela.emp_cargo AS ec
			LEFT JOIN empleado AS e USING (id_empleado)
			LEFT JOIN liqui_escuela.cargo AS c USING (id_cargo)
			GROUP BY e.id_empleado
            ORDER BY total_hs DESC;


            -- VISTA DE CARGOS AGRUPADOS POR ESTADO (OCUPADO / VACANTE)
CREATE
	OR REPLACE VIEW
		liqui_escuela.vw_estado_cargo AS
			SELECT 
				CONCAT(e.apellido, ', ', e.nombre) AS nombre_completo
			,	e.dni
			, 	c.id_cargo
			, 	c.denominacion
			,	c.horas
            ,   c.id_escuela
			, 	CASE 
					WHEN COALESCE(e.apellido, '') = '' THEN 'VACANTE'
					ELSE 'OCUPADO'
				END AS estado_cargo
			FROM liqui_escuela.emp_cargo AS ec
			RIGHT JOIN empleado AS e USING (id_empleado)
			RIGHT JOIN liqui_escuela.cargo AS c USING (id_cargo)
			ORDER BY estado_cargo;

-- la vista estado_cargo podría usarla para buscar cargos VACANTES, obteniendo infomación sobre la Escuela y Ciudad a la que pertenece. 
-- (DISPONIBILIDAD) EJEMPLO:
SELECT * FROM vw_estado_cargo
LEFT JOIN escuela AS e
USING (id_escuela)
WHERE estado_cargo = 'VACANTE' AND denominacion LIKE 'director';



-- VISTA DE EMPLEADO SEGÚN AREA EN LA QUE TRABAJA por ESCUELA. EJEMPLO QUE COMBINA JOINS CON SUBQUERYS
CREATE
	OR REPLACE VIEW
		liqui_escuela.vw_empleadoxarea AS
				SELECT	CONCAT(e.apellido, ', ', e.nombre) AS nombre_completo
				,		area_esc.area_escuela
				,		area_esc.nombre AS escuela
				FROM liqui_escuela.emp_cargo AS ec
				LEFT JOIN liqui_escuela.empleado as e USING (id_empleado)
				LEFT JOIN (
						SELECT  c.id_cargo
						,		c.denominacion
						,		a.area_escuela
						,	 	esc.nombre
						FROM liqui_escuela.cargo AS c
						LEFT JOIN liqui_escuela.area AS a USING (id_area)
						LEFT JOIN liqui_escuela.escuela as esc USING (id_escuela)
							) AS area_esc USING (id_cargo)
				ORDER BY e.apellido;