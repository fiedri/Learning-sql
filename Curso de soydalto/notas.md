# Que es una entidad (tabla)
Es una representacion de algo de algo

# Notacion de chen
Una entidad guardada

# Atributos
- simples: Son atributos que tienen datos unicos,
- compuestos: Atributo que se compone de otros mas pequeños
- Multivalor
- Derivados: se obtienen a partir de otros


El cliente de una base de datos permite una gestion mas facil de las mismas

# Clausulas
- `As` permite llamar un campo por un nombre diferente ejemplo `SELECT last_name AS apellido FROM employees`
- `ORDER BY` sirve para ordenar los registros de una tabla en una consulta, ejemplo: `SELECT * FROM products ORDER BY Price;`:
    - `ASC`: Ascendente (el valor mas basjo es null, luego siguen los numeros, caracteres especiales, letras): `SELECT * FROM products ORDER BY Price ASC NULLS LAST;`
    - `DESC`: Descendente (lo mismo que ascendente pero al revez): `SELECT * FROM products ORDER BY Price ASC NULLS FIRST;`
    - `RANDOM()`: De forma aleatoria: `SELECT * FROM Products ORDER BY RANDOM();`
- `DISTINCT`: elemina los valores duplicados `SELECT DISTINCT ProductName FROM products;`
- `LIMIT`: limita el numero de registros que devuelve una consulta: `SELECT * FROM Customers WHERE CustomerID >= 50 AND NOT Country = "Germany" LIMIT 5`

## Condiciones
`WHERE` Permite agregar condiciones a la consulta ej: `SELECT * FROM product WHERE product_id = 30`

# subconsultas
Son consultas dentro de otras consultas