
INSERT INTO ctl_paises (nombre, prefijo)
VALUES ('México', '+52');

SELECT * FROM ctl_paises ;


INSERT INTO ctl_estados (nombre, pais)
SELECT 'Sinaloa', id_pais
FROM ctl_paises
WHERE nombre = 'México';

SELECT * FROM ctl_estados;


INSERT INTO ctl_ciudades (nombre, estado)
SELECT c.nombre, e.id_estado
FROM (VALUES ('Culiacán'),
             ('Mazatlán'),
             ('Los Mochis')) AS c(nombre)
         CROSS JOIN ctl_estados e
WHERE e.nombre = 'Sinaloa';


SELECT * FROM ctl_ciudades;


INSERT INTO tbl_alumnos (
    nombre,
    apellido_paterno,
    apellido_materno,
    fecha_nacimiento,
    curp,
    num_telefono_fijo,
    num_telefono_movil,
    correo_personal,
    correo_institucional,
    nombre_tutor,
    contacto_tutor,
    num_control
)
VALUES
('Alejandro', 'Valenzuela', 'Rivera', '2005-03-14',
 'VARA050314HSLLVL01',
 NULL,
 '6671234567',
 'alejandro.valenzuela@example.com',
 '240500101@itsinaloa.edu.mx',
 'Rosa Rivera',
 '6677654321',
 '240500101'),

('Ximena', 'Osuna', 'Castro', '2004-08-21',
 'OUCX040821MSNSXM02',
 '6677012345',
 '6672345098',
 'ximena.osuna@example.com',
 '240500102@itsinaloa.edu.mx',
 'Miguel Osuna',
 '6678765432',
 '240500102'),

('Brayan', 'Leyva', 'García', '2005-11-06',
 'LEGB051106HSYVRR03',
 NULL,
 '6673456789',
 NULL,
 '240500103@itsinaloa.edu.mx',
 'Patricia García',
 '6679876543',
 '240500103'),

('Regina', 'Zamora', 'Ibarra', '2004-05-29',
 'ZAIR040529MSLMGB04',
 NULL,
 '6694567890',
 'regina.zamora@example.com',
 '240500104@itsinaloa.edu.mx',
 'Eduardo Ibarra',
 '6690987654',
 '240500104'),

('Emiliano', 'Cota', 'Beltrán', '2005-01-18',
 'COBE050118HSXTLN05',
 NULL,
 '6685678901',
 NULL,
 '240500105@itsinaloa.edu.mx',
 'Mónica Beltrán',
 '6681122334',
 '240500105'),

('Natalia', 'Inzunza', 'López', '2004-10-12',
 'IULN041012MSNZPT06',
 NULL,
 '6686789012',
 'natalia.inzunza@example.com',
 '240500106@itsinaloa.edu.mx',
 'Jorge López',
 '6682233445',
 '240500106');

SELECT id_alumno,
       nombre,
       apellido_paterno,
       apellido_materno,
       num_control
FROM tbl_alumnos
ORDER BY num_control;


INSERT INTO tbl_direcciones (
    calle,
    numero_ext,
    numero_int,
    colonia,
    cp,
    ciudad
)
SELECT v.calle,
       v.numero_ext,
       v.numero_int,
       v.colonia,
       v.cp,
       c.id_ciudad
FROM (
    VALUES
    ('Avenida Álvaro Obregón', '125', NULL, 'Centro', '80000', 'Culiacán'),
    ('Calle Benito Juárez', '48', 'A', 'Las Quintas', '80060', 'Culiacán'),
    ('Avenida Insurgentes', '215', NULL, 'Centro', '82000', 'Mazatlán'),
    ('Calle Rafael Buelna', '73', NULL, 'Palos Prietos', '82120', 'Mazatlán'),
    ('Calle Ignacio Zaragoza', '56', '3', 'Centro', '81200', 'Los Mochis'),
    ('Avenida Independencia', '318', NULL, 'Scally', '81240', 'Los Mochis')
) AS v(
    calle,
    numero_ext,
    numero_int,
    colonia,
    cp,
    ciudad_nombre
)
JOIN ctl_ciudades c
    ON c.nombre = v.ciudad_nombre;

SELECT * FROM tbl_direcciones;


INSERT INTO rel_alumnos_direcciones (
    direccion,
    alumno
)
SELECT d.id_direccion,
       a.id_alumno
FROM (
    VALUES
    ('Avenida Álvaro Obregón', '125', '240500101'),
    ('Calle Benito Juárez', '48', '240500102'),
    ('Avenida Insurgentes', '215', '240500103'),
    ('Calle Rafael Buelna', '73', '240500104'),
    ('Calle Ignacio Zaragoza', '56', '240500105'),
    ('Avenida Independencia', '318', '240500106')
) AS v(
    calle,
    numero_ext,
    num_control
)
JOIN tbl_direcciones d
    ON d.calle = v.calle
   AND d.numero_ext = v.numero_ext
JOIN tbl_alumnos a
    ON a.num_control = v.num_control;

SELECT * FROM rel_alumnos_direcciones;


INSERT INTO tbl_datos_medicos (
    tipo_sangre,
    alumno
)
SELECT v.tipo_sangre,
       a.id_alumno
FROM (
    VALUES
    ('O+',  '240500101'),
    ('A-',  '240500102'),
    ('B+',  '240500103'),
    ('AB+', '240500104'),
    ('O-',  '240500105'),
    ('A+',  '240500106')
) AS v(
    tipo_sangre,
    num_control
)
JOIN tbl_alumnos a
    ON a.num_control = v.num_control;

SELECT * FROM tbl_datos_medicos;


INSERT INTO ctl_alergias (
    nombre,
    descripcion
)
VALUES
('Polvo',
 'Reacción alérgica provocada por partículas de polvo presentes en el ambiente'),

('Mariscos',
 'Reacción alérgica ocasionada por el consumo de mariscos'),

('Amoxicilina',
 'Reacción alérgica ante medicamentos que contienen amoxicilina'),

('Picadura de abeja',
 'Reacción alérgica provocada por picaduras de abeja');

SELECT * FROM ctl_alergias;


INSERT INT
    O ctl_discapacidades_medicas (
    nombre,
    descripcion
)
VALUES
('Auditiva parcial',
 'Disminución parcial de la capacidad auditiva'),

('Motriz',
 'Limitación que afecta el movimiento de alguna parte del cuerpo'),

('Visual parcial',
 'Disminución parcial de la capacidad visual'),

('Del aprendizaje',
 'Dificultad que puede afectar determinados procesos de aprendizaje');

SELECT * FROM ctl_discapacidades_medicas;


INSERT INTO rel_alergias_datos_medicos (
    alergia,
    dato_medico
)
SELECT al.id_alergia,
       dm.id_dato_medico
FROM (
    VALUES
    ('Polvo',             '240500101'),
    ('Mariscos',          '240500102'),
    ('Amoxicilina',       '240500104'),
    ('Picadura de abeja', '240500105'),
    ('Polvo',             '240500105')
) AS v(
    alergia,
    num_control
)
JOIN ctl_alergias al
    ON al.nombre = v.alergia
JOIN tbl_alumnos a
    ON a.num_control = v.num_control
JOIN tbl_datos_medicos dm
    ON dm.alumno = a.id_alumno;

SELECT * FROM rel_alergias_datos_medicos;


INSERT INTO rel_discapacidades_datos_medicos (
    discapacidad,
    dato_medico
)
SELECT dis.id_discapacidad,
       dm.id_dato_medico
FROM (
    VALUES
    ('Auditiva parcial', '240500103'),
    ('Motriz',           '240500106')
) AS v(
    discapacidad,
    num_control
)
JOIN ctl_discapacidades_medicas dis
    ON dis.nombre = v.discapacidad
JOIN tbl_alumnos a
    ON a.num_control = v.num_control
JOIN tbl_datos_medicos dm
    ON dm.alumno = a.id_alumno;

SELECT * FROM rel_discapacidades_datos_medicos;


SELECT a.nombre,
       a.apellido_paterno,
       a.apellido_materno,
       a.num_control,
       dm.tipo_sangre,
       al.nombre AS alergia
FROM tbl_alumnos a
INNER JOIN tbl_datos_medicos dm
    ON a.id_alumno = dm.alumno
INNER JOIN rel_alergias_datos_medicos radm
    ON dm.id_dato_medico = radm.dato_medico
INNER JOIN ctl_alergias al
    ON radm.alergia = al.id_alergia
ORDER BY a.num_control;


SELECT a.num_control,
       a.nombre,
       a.apellido_paterno,
       a.apellido_materno,
       a.num_telefono_movil,
       a.correo_institucional,
       d.calle,
       d.numero_ext,
       d.numero_int,
       d.colonia,
       d.cp,
       c.nombre AS ciudad,
       e.nombre AS estado,
       p.nombre AS pais,
       dm.tipo_sangre,
       al.nombre AS alergia,
       dis.nombre AS discapacidad
FROM tbl_alumnos a
LEFT JOIN rel_alumnos_direcciones rad
    ON a.id_alumno = rad.alumno
LEFT JOIN tbl_direcciones d
    ON rad.direccion = d.id_direccion
LEFT JOIN ctl_ciudades c
    ON d.ciudad = c.id_ciudad
LEFT JOIN ctl_estados e
    ON c.estado = e.id_estado
LEFT JOIN ctl_paises p
    ON e.pais = p.id_pais
LEFT JOIN tbl_datos_medicos dm
    ON a.id_alumno = dm.alumno
LEFT JOIN rel_alergias_datos_medicos ralm
    ON dm.id_dato_medico = ralm.dato_medico
LEFT JOIN ctl_alergias al
    ON ralm.alergia = al.id_alergia
LEFT JOIN rel_discapacidades_datos_medicos rdm
    ON dm.id_dato_medico = rdm.dato_medico
LEFT JOIN ctl_discapacidades_medicas dis
    ON rdm.discapacidad = dis.id_discapacidad
ORDER BY a.num_control;


SELECT 'ctl_paises' AS tabla,
       COUNT(*) AS registros
FROM ctl_paises

UNION ALL

SELECT 'ctl_estados',
       COUNT(*)
FROM ctl_estados

UNION ALL

SELECT 'ctl_ciudades',
       COUNT(*)
FROM ctl_ciudades

UNION ALL

SELECT 'ctl_alergias',
       COUNT(*)
FROM ctl_alergias

UNION ALL

SELECT 'ctl_discapacidades_medicas',
       COUNT(*)
FROM ctl_discapacidades_medicas

UNION ALL

SELECT 'tbl_alumnos',
       COUNT(*)
FROM tbl_alumnos

UNION ALL

SELECT 'tbl_direcciones',
       COUNT(*)
FROM tbl_direcciones

UNION ALL

SELECT 'tbl_datos_medicos',
       COUNT(*)
FROM tbl_datos_medicos

UNION ALL

SELECT 'rel_alumnos_direcciones',
       COUNT(*)
FROM rel_alumnos_direcciones

UNION ALL

SELECT 'rel_alergias_datos_medicos',
       COUNT(*)
FROM rel_alergias_datos_medicos

UNION ALL

SELECT 'rel_discapacidades_datos_medicos',
       COUNT(*)
FROM rel_discapacidades_datos_medicos;


SELECT a.num_control,
       a.nombre,
       a.apellido_paterno,
       a.apellido_materno,
       cd.nombre AS discapacidad
FROM tbl_alumnos a
INNER JOIN tbl_datos_medicos dm
    ON a.id_alumno = dm.alumno
INNER JOIN rel_discapacidades_datos_medicos rddm
    ON dm.id_dato_medico = rddm.dato_medico
INNER JOIN ctl_discapacidades_medicas cd
    ON rddm.discapacidad = cd.id_discapacidad
ORDER BY a.num_control;


