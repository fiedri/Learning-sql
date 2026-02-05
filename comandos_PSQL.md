# iniciar seccion
psql --username=nombre_users --dbname=postgres

# listar base de datos
\l

# conectar a una base de datos
\c database_name

# listar tablas
\d

# Detalles de la tabla
\d table_name


# Eliminar todos los datos de una tabla
TRUNCATE nombre_tabla;

# convertir una base de datos en un archivo
pg_dump
pg_dump --clean --create --inserts --username=freecodecamp database_name > database_name.sql