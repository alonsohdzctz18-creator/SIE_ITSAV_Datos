SELECT
    column_name,
    data_type,
    column_default,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'tbl_alumnos'
  AND column_name = 'num_control';

SELECT
    num_control,
    nombre,
    apellido_paterno,
    activo
FROM public.tbl_alumnos
ORDER BY num_control;

UPDATE public.tbl_alumnos
SET num_control = '240500107'
WHERE nombre = 'Fernando'
  AND apellido_paterno = 'Castillo'
  AND num_control IS NULL
RETURNING nombre, apellido_paterno, num_control;

SELECT
    sequence_schema,
    sequence_name
FROM information_schema.sequences
WHERE sequence_schema = 'public';

CREATE SEQUENCE IF NOT EXISTS public.seq_num_control
    START WITH 240500108
    INCREMENT BY 1;

ALTER TABLE public.tbl_alumnos
    ALTER COLUMN num_control
        SET DEFAULT nextval('public.seq_num_control')::VARCHAR(9);

SELECT
    column_name,
    column_default,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'tbl_alumnos'
  AND column_name = 'num_control';

SELECT
    num_control,
    nombre,
    apellido_paterno,
    apellido_materno,
    activo
FROM public.tbl_alumnos
WHERE num_control = '240500108';

SELECT
    num_control,
    nombre,
    apellido_paterno,
    activo
FROM public.tbl_alumnos
WHERE num_control = '240500108';