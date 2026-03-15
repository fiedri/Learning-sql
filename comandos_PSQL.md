# iniciar seccion
psql --username=nombre_users --dbname=postgres

psql -U postgres -d postgres

psql postgres

# Conéctate como postgres directamente (funciona por peer authentication)
sudo -u postgres psql

# O si prefieres:
psql -U postgres postgres

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


# crear usuario
CREATE USER pgadmin_user WITH PASSWORD 'pgadmin_29';