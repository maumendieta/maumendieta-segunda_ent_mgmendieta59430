# PROYECTO LIQUIDACIÓN SUELDOS - ESCOLAR # 
## SEGUNDA ENTREGA ##
**MENDIETA, MAURO GERMÁN**
:white_check_mark: *COMISIÓN 59430*

-***Anderson Michel TORRES*** *(Profesor)*
-***Hugo Gonzalez*** *(Tutor Regular CoderAsk)*
-***Nicolás Maugeri*** *(Tutor Adjunto CoderAsk)*

## Planteo inicial de la BD - D.E.R. Ontológico *(realizado en Excalidraw)*
***El siguiente proyecto surge de la necesidad de armar un sistema ágil que permita realizar el seguimiento de la planta, docente y no docente, de diversos centros educativos. En base al seguimiento del personal, se pretende realizar la liquidación de sueldos de cada uno de los agentes pertenecientes a cada Escuela.***

***Aunque parezca algo similar a cualquier empresa, la liquidación escolar tiene una dinámica propia que responde a la realidad cotidiana de cada Escuela. Dificilmente haya dos sueldos iguales en una misma escuela, ya que hay titulares, reemplazantes, docentes que trabajan por hora, otros que trabajan en cargos, docentes que pueden ser titulares y reemplazantes al mismo tiempo, etc. Por este motivo, es importante que el seguimiento que se realiza sobre el personal, sea lo más preciso posible para poder determinar, a fin de mes, el sueldo correspondiente a cada persona.*** 

## TRABAJO REALIZADO

En la presente entrega se presenta el desarrollo de inserción de datos en las tablas creadas con la primer entrega en la base de datos LIQUI_ESCUELA.
Además se explica el desarrollo de los objetos que comienzan a conformar el Proyecto.


## OBJETOS

### TRIGGERS
#### 
#### 
#### 
#### 

### STORE PROCEDURES
####
####
####
#### 
#### 

### FUNCTIONS
Funciones SQL diseñadas para la gestión de docentes en un sistema escolar, implementadas en MySQL. A continuación, se detalla la funcionalidad de cada función incluida.

## 📂 Funciones Incluidas

### 1. `fx_empleado_horas`
**Descripción:** 
      - Calcula la cantidad total de horas asignadas a un docente según su número de documento (DNI).  
**Parámetros:**
      - `_dni` (`INT`): Número de documento del docente.  
**Devuelve:**  
      - Total de horas (`INT`).  
**Control de errores:**  
      - Si el docente no existe, lanza un error con el mensaje: `"DOCENTE INEXISTENTE"`.

### 2. `fx_calc_ant`
**Descripción:**
    - Calcula la antigüedad en años de un docente a partir de su fecha de ingreso.
**Parámetros:**
    - _dni (`INT`): Número de documento del docente.
**Devuelve:**
    - Antigüedad en años (`INT`).
**Notas:**
    - Si no hay fecha de ingreso registrada, devuelve `NULL`.


## 
## 
