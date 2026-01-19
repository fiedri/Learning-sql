# Tipos de datos en sql
Al crear una tabla en sql necesitas definir el tipo de datos de cada columna, es importante saber que los tipos de datos varian dependiendo del sistema de gestion de base de datos relacional que se utilice, ejemplo: los tipos de **postgreSQL** difieren un poco de los de **MySQL**, 
```bash
CREATE TABLE table_name(
  column1 data_type column_constraint,
  column2 data_type column_constraint,
  column3 data_type column_constraint,
  ... etc
);
```
Los tipos de datos se dividen en 6 categorias:
- Numericos: `INTEGER`, `FLOAT`, `SERIAL` y `DECIMAL`.
- Fecha y tiempo: `TIMESTAMP`, `DATE` y `TIME`.
- Caracteres y texto: `CHAR`, `VARCHAR` y `TEXT`.
- Unicode: `NTEXT` Y `NVARCHAR`.
- Binario: usado para guardar datos no textuales, como imagenes,audio y videos.
- Otros: `XML` y `TABLE`

## Tipos numericos
### `INTEGER`
```bash
unidades_vendidas INTEGER
```
en este ejemplo, asignamos este tipo de datos a la columna `unidades_vendidas`.
`INTEGER` consume 4 bytes, y sus valores pueden ir de -2,147,483,648 a 2,147,483,647.
Tambien existen `SMALLINT` y `BIGINT`, los cuales basicamente son lo mismo que `INTEGER`, solo que tienen un rango mas pequeño y mas grande de numeros
### `SERIAL`
```bash
id SERIAL
```
Este tipo de dato es muy util para crear identificadores unicos, este automaticamente se incrementa cuando nuevas filas son añadidas. Por ejemplo: la primera fila tiene un `id` de `1`, la segunda tendra un `id` de `2` y asi sucesivamente conforme se crean mas filas
En **MySQL** el equivalente de SERIAL seria `AUTO_INCREMENT`

## Tipos de texto
### `VARCHAR`
```bash
nombre VARCHAR(50)
```
Este tipo de dato sirve para guardar texto de una longitud predefinida, en el ejemplo el valor no puede guardar texto que exceda la longitud de 50 caracteres
### `TEXT`
```bash
nombre TEXT
```
este tipo de dato permite guardar texto de cualquier longitud

## Tipos de fecha y tiempo
- `DATE`: guarda la fecha de un evento en un formato en especifico
- `TIME`: guardar el tiempo, por ejemplo de cuando empieza un evento
- `TIMESTAMP`: combina los 2 anteriores

## `BOOLEAN`
```bash
is_active BOOLEAN
```
Sirve para guardar valores de TRUE o FALSE