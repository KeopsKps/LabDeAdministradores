-- Primer laboratorio:
-- 10 consultas por cada tabla incluyendo: SELECT, INSERT, DELETE, UPDATE


-- Tabla: Trabajador
-- Campos: NoAlcaldia(VARCHAR(25)), NoMTI(VARCHAR(25)), CedulaTrabajador(VARCHAR(16))
-- Nombre(VARCHAR(25)), Apellido(VARCHAR(25))

-- Insercion de trabajadores
INSERT INTO Trabajador VALUES (
    'Agregar Numero de alcaldia',
    'Agregar Numero de MTI',
    'Agregar CedulaTrabajor',
    'Nombre de trabajador',
    'Apellido de trabajador'
);

-- Seleccion de trabajadores
SELECT NoAlcaldia as 'Numero de alcaldia',
       NoMTI as 'Numero de MTI',
       CedulaTrabajador as 'Cedula',
       Nombre as 'Nombre de trabajador',
       Apellido as 'Apellidos'
FROM Trabajador
ORDER BY 'Nombre de trabajador' DESC;

-- Eliminacion de trabajador con cedula 'xxx-xxxxxx-xxx'
DELETE FROM Trabajador
WHERE CedulaTrabajador = 'xxx-xxxxxx-xxx';

-- Actualizacion de nombre de trabajador
UPDATE Trabajar    
SET Nombre = 'Nombre nuevo'
WHERE CedulaTrabajador = 'xxx-xxxxxx-xxx';

-- Selecciona los trabajadores cuyos nombres empiezan con 'N'
SELECT CedulaTrabajdor as 'Cedula de trabajador',
       Nombre as 'Nombre',
       Apellido as 'Apellido'
FROM Trabajador
WHERE 'Nombre' LIKE 'N%';



-- Tabla: Proyecto
-- Campos: idProyecto(INT), NoRecibo(VARCHAR(30)), CedulaTrabajador(VARCHAR(16))

-- Insercion de proyectos
INSERT INTO Proyecto VALUES (
    1,
    'Numero de recibo',
    'Cedula de trabajador'
);

-- Seleccionar todos los proyectos
SELECT idProyecto as 'Identificador proyecto',
       NoRecibo as 'Numero Recibo',
       CedulaTrabajador as 'Cedula de trabajador'
FROM Proyecto
ORDER BY 'Identificador proyecto' DESC;

-- Selecciona los trabajadores que tienen proyecto mostrar:
-- nombre, apellido y id del proyecto
SELECT Nombre as 'Nombre trabajador',
       Apellido,
       idProyecto as 'Identificador de proyecto'
FROM Trabajador
INNER JOIN Proyecto ON Trabajador.CedulaTrabajador = Proyecto.CedulaTrabajador
ORDER BY 'Identificador de proyecto';

-- Mostrar la cantidad de proyectos que tiene cada trabajador
(SELECT Nombre as 'Nombre trabajador',
       Apellido,
       COUNT(idProyecto) as 'Cantidad de Proyectos'
FROM Trabajador
LEFT JOIN Proyecto ON Trabajador.CedulaTrabajador = Proyecto.CedulaTrabajador
WHERE idProyecto IS NULL
GROUP BY 'Nombre Trabajador')
UNION
(SELECT Nombre as 'Nombre trabjador',
       Apellido,
       COUNT(idProyecto) as 'Cantidad de Proyectos'
FROM Trabajador
INNER JOIN Proyecto ON Trabajador.CedulaTrabajador = Proyecto.CedulaTrabajador
GROUP BY 'Nombre Trabajador');

-- Actualizar el numero de recibo de un proyecto
UPDATE Proyecto
SET NoRecibo = 'Nuevo numero de recibo'
WHERE CedulaTrabajador = 'Cedula de un trabajador';
