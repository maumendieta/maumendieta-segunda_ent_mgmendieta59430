-- PROCEDIMIENTO DESTINADO A REGISTAR BAJAS DE EMPLEADOS
-- SE BASA EN DOS VARIABLES: DNI Y MOTIVO

DELIMITER //
DROP PROCEDURE IF EXISTS liqui_escuela.pd_busca_empleado//
CREATE PROCEDURE liqui_escuela.pd_busca_empleado( 
	IN emp_dni INT,
    OUT emp_id INT)
BEGIN
	SELECT 
	e.id_empleado INTO emp_id
    FROM liqui_escuela.empleado as e
    WHERE e.dni = emp_dni;
END//

DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS liqui_escuela.pd_baja_empleado//
CREATE PROCEDURE liqui_escuela.pd_baja_empleado( 
	IN emp_dni INT,
    IN baja DATE,
    IN motivo INT)
BEGIN
	CALL liqui_escuela.pd_busca_empleado(emp_dni, @salida);
    
    UPDATE liqui_escuela.empleado as e
    SET e.fecha_baja = baja,
		e.observaciones = motivo
	WHERE e.id_empleado = @salida;
END//

DELIMITER ;


-- llamado a los procedimientos
SET @salida = 0;
CALL liqui_escuela.pd_baja_empleado (22137830,'2023-02-03',5);

-- prueba inicial
SET @salida = 0;
CALL liqui_escuela.pd_busca_empleado (22137830,@salida)


-- MISMA FUNCIÓN QUE LA ANTERIOR + USO DE FUNCIÓN INTERNAMENTE PARA DETERMINAR MOTIVO DE BAJA
DELIMITER //
DROP PROCEDURE IF EXISTS liqui_escuela.pd_baja_empleado//
CREATE PROCEDURE liqui_escuela.pd_baja_empleado( 
	IN emp_dni INT,
    IN baja DATE,
    IN motivo INT)
BEGIN
	DECLARE _motivo VARCHAR (200);
	CALL liqui_escuela.pd_busca_empleado(emp_dni, @salida);
    
    SELECT liqui_escuela.fx_mot_baja (motivo) INTO _motivo
    FROM DUAL;
        
    UPDATE liqui_escuela.empleado as e
    SET e.fecha_baja = baja,
		e.observaciones = _motivo
	WHERE e.id_empleado = @salida;
END//

DELIMITER ;