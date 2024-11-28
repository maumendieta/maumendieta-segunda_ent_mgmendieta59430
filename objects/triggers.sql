DELIMITER //

DROP TRIGGER IF EXISTS liqui_escuela.tg_incomp_emp //

CREATE TRIGGER liqui_escuela.tg_incomp_emp
BEFORE INSERT 
ON liqui_escuela.emp_cargo
FOR EACH ROW
BEGIN
    -- Variables locales
    DECLARE hs_actuales INT DEFAULT 0;
    DECLARE hs_nuevas INT DEFAULT 0;
    DECLARE msg VARCHAR(255) DEFAULT "El agente, con esta designación, supera el límite de Horas Permitidas";

    -- Obtener las horas actuales del empleado desde la vista
    SELECT vw.total_hs 
    INTO hs_actuales
    FROM liqui_escuela.vw_horasxemp AS vw
    WHERE vw.id_empleado = NEW.id_empleado;

    -- Obtener las horas del nuevo cargo relacionado con el ID del cargo
    SELECT c.horas INTO hs_nuevas
    FROM cargo AS c
    WHERE c.id_cargo = NEW.id_cargo;

    -- Verificar si el total de horas supera el límite permitido
    IF hs_actuales + hs_nuevas > 50 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = msg;
    END IF;

END //

/* Tu trigger tiene una buena estructura general, pero hay algunos puntos que pueden causar errores o problemas en su implementación. Voy a analizarlo y corregir algunos detalles para asegurarte de que funcione correctamente:

Problemas y Correcciones
Orden de Declaraciones:

En MySQL, las declaraciones de variables con DECLARE deben ir al principio del bloque BEGIN...END del trigger.
Asignación de Valores:

La consulta SELECT c.horas_cargo INTO hs_nuevas FROM cargos AS c; carece de una condición WHERE para relacionarla con el nuevo registro (NEW). Esto causará un error si hay más de un registro en la tabla cargos.
Contexto de Variables Globales:

Usar SET @msg para la variable de mensaje no es necesario; puedes usar una variable local del trigger.
Restricción de Transacciones:

Como el trigger es de tipo BEFORE INSERT, asegúrate de que las operaciones dentro de este sean válidas en ese contexto. No puedes realizar transacciones explícitas dentro del trigger. */
Versión Corregida
sql
Copiar código
DELIMITER //

DROP TRIGGER IF EXISTS liqui_escuela.tg_incomp_emp //

CREATE TRIGGER liqui_escuela.tg_incomp_emp
BEFORE INSERT 
ON liqui_escuela.emp_cargo
FOR EACH ROW
BEGIN
    -- Variables locales
    DECLARE hs_actuales INT DEFAULT 0;
    DECLARE hs_nuevas INT DEFAULT 0;
    DECLARE msg VARCHAR(255) DEFAULT "El agente, con esta designación, supera el límite de Horas Permitidas";

    -- Obtener las horas actuales del empleado desde la vista
    SELECT vw.total_hs 
    INTO hs_actuales
    FROM liqui_escuela.vw_horasxemp AS vw
    WHERE vw.id_empleado = NEW.id_empleado;

    -- Obtener las horas del nuevo cargo relacionado con el ID del cargo
    SELECT c.horas_cargo 
    INTO hs_nuevas
    FROM cargos AS c
    WHERE c.id_cargo = NEW.id_cargo;

    -- Verificar si el total de horas supera el límite permitido
    IF hs_actuales + hs_nuevas > 50 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = msg;
    END IF;

END //

/*DELIMITER ;
Explicación de Cambios
Declaración de Variables Locales:

DECLARE hs_actuales y DECLARE hs_nuevas se declararon al principio del bloque, como lo exige MySQL.
msg se convirtió en una variable local en lugar de una global (@msg), ya que no se necesita más allá del alcance del trigger.
Consulta Condicionada para el Cargo:

Agregué una condición WHERE c.id_cargo = NEW.id_cargo para asegurar que se seleccione el cargo correcto relacionado con el nuevo registro.
Mensaje de Error en SIGNAL:

Ahora utiliza la variable msg correctamente para el mensaje de error personalizado.
Buena Práctica con Valores Predeterminados:

Se asignaron valores predeterminados (DEFAULT) a las variables para evitar posibles errores si las consultas no devuelven resultados.
Consideraciones Adicionales
Asegúrate de que la vista vw_horasxemp y la tabla cargos siempre estén actualizadas y no tengan registros huérfanos o inconsistencias.
Si es posible que el empleado no tenga horas asignadas aún, la consulta de hs_actuales debería manejar un caso sin resultados. Por ejemplo, puedes inicializar hs_actuales en 0 y verificar si la consulta devuelve valores antes de sumar.
Con estos ajustes, el trigger debería funcionar correctamente.*/
