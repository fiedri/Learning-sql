# base de datos
## crear
```SQL
CREATE DATABASE nombre_base_de_datos;
```
## Rename
```SQL
ALTER DATABASE database_name RENAME TO new_database_name;
```

# tablas
## Crear
```SQL
CREATE TABLE nombre_tabla();
```
## Borrar
```SQL
DROP TABLE nombre_tabla();
```
# columnas
```SQL
ALTER TABLE nombre_tabla ADD COLUMN name_column DATA_TYPE;
```
Cambia ADD por:
- DROP: para eliminar
- RENAME: para renombrar

# filas
```SQL
INSERT INTO table(colum1, colum2) VALUES(value1, value2);
```
## Borrar
```SQL
DELETE FROM table_name WHERE condition;
```
## Editar
```SQL
UPDATE table_name SET column_name=new_value WHERE condition;
```


# ver datos
```SQL
SELECT columns FROM table_name;
```