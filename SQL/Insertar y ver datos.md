# Insertar y ver datos
Estamos trabajando con postgreSQL
## Paso 1: crear la tabla
```SQL
CREATE TABLE dogs(
    id SERIAL,
    name VARCHAR(100),
    age INTEGER
);
```

## Paso 2: insercion de datos
1. Especificando columnas de los valores que seran insertados:
```SQL
INSERT INTO dogs(name, age) VALUES ('Gino', 3);
```
2. Sin especificar columnas (mas excento a errores):
```SQL
INSERT INTO dogs VALUES ('Gino', 3);
```
3. Agregando mas de una fila:
```SQL
INSERT INTO dogs (name, age) VALUES ('Gino', 3), ('Nora', 2);
```

## Paso 3: Consulta de datos
En SQL, se usa `SELECT` para consultar datos de una o mas tablas
1. Sacando todos los elementos de una tabla.
```SQL
SELECT * FROM dogs;
```
2. Consultando columnas especificas
```SQL
SELECT name, age FROM dogs;
```
3. Consulta basadas en condiciones especificas:
```SQL
SELECT * FROM dogs WHERE age < 3;
```

---
Si quisieras encontrar la edad de 'Gino', usas el operador `=`
```SQL
SELECT age FROM dogs WHERE name = 'Gino';
```