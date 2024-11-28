# PROYECTO LIQUIDACIÓN SUELDOS - ESCOLAR # 
## SEGUNDA ENTREGA ##
**MENDIETA, MAURO GERMÁN**
:white_check_mark: *COMISIÓN 59430*

-****Anderson Michel TORRES*** *(Profesor)*
-****Hugo Gonzalez*** *(Tutor Regular CoderAsk)*
-****Nicolás Maugeri*** *(Tutor Adjunto CoderAsk)*

## TRABAJO REALIZADO

En la presente entrega se presenta el desarrollo de inserción de datos en las tablas creadas la primer entrega de la base de datos LIQUI_ESCUELA.
Además se explica el desarrollo de los objetos que comienzan a conformar el Proyecto.

La entrega está organizada en Carpetas, para poder organizar el trabajo realizado. 
Por un lado se encuentra la carpeta `Inserts` que contiene los Script de inserción y los archivos `.CSV` que se utilizaron para la carga.
Por otro lado se presenta la carpeta `Objetos`, la cual contiene los scripts de creación de Triggers, Procedimientos, Vistas y Funciones.

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

### 3. fx_porc_ant      
**Descripción:**      
      - Calcula el porcentaje de antigüedad aplicable al sueldo de un docente, basado en su antigüedad.      
**Parámetros:**            
      _dni (INT): Número de documento del docente.            
**Devuelve:** Porcentaje de antigüedad (FLOAT).      
      Escala de porcentajes:      
            - ***0 a 5 años: 0.5%***      
            - ***5 a 10 años: 0.75%***      
            - ***10 a 15 años: 1.0%***      
            - ***15 a 20 años: 1.25%***      
            - ***Más de 20 años: 1.5%***      

