# Condiciones
Ayudan a encontrar y a filtrar datos especificos para hacer diferentes operaciones como: encontrar, eliminar y modificar

## Clausula Where
`WHERE` Permite agregar condiciones a la consulta. Acepta condiciones con operadores de comparacion, `WHERE NOT` niega una condicion. Ejemplo:
- `SELECT * FROM products WHERE product_id = 30`
- `DELETE FROM products WHERE product_id = 30`
- `UPDATE products SET price=20 WHERE product_id = 30`

## Operadores logicos
- `AND`: permite ejecutar varias condiciones a la vez, tienen que cumplirse las 2 a la vez para que de verdadero
- `OR`: Tiene que cumplirse una sola condicion para que sea verdadera
- `NOT`: Niega la condicion
- `IN` Y `NOT IN`: Opera sobre algo parecido a una tupla o conjunto de datos, ejemplo: `SELECT * FROM Products WHERE SupplierID IN (3,4,5,6)` (SupplierId puede ser todos los elementos que estan en la dupla)

## Operador de comparacion
- `BETWEEN`: se utiliza para selecionar valores en un rango en especifico `SELECT * FROM products WHERE price BETWEEN 20 AND 30`, tambien sirve para seleccionar fechas: `SELECT * FROM products WHERE birthDate BETWEEN "1960-0-1" AND "1970-0-1"`, el valor 1, no puede ser mayor o igual al valor 2
- `LIKE`: Permite realizar busquedas de texto parciales utilizando algo llamado `caracter comodin`, por defecto utilizarlo es exactamente igual que utilizar un `=`:
    - `%`: significa que puede haber otros caracteres antes, despues o ambas dependiendo de en que lugar se use, ej: `SELECT * FROM peoples WHERE name LIKE '%ch'`(esto puede devorlverme una lista de registro con nombres que terminen en ch, como Friedrich) o `SELECT * FROM peoples WHERE name LIKE 'F%'` (devolve una lista de registros con nombres que comienzan por f) y tambien `SELECT * FROM peoples WHERE name LIKE '%R%'` (antes de la r y despues puede tener cualquier cosa)
    - `_`: significa que puede tener cualquier cosa, ejemplo: `SELECT * FROM peoples WHERE name LIKE 'F_______h'` (devuelve resultados, en los que comience con F y termine con h, pero que entre esas 2 letras tiene 7 caracteres que pueden ser cualquier cosa), `SELECT * FROM peoples WHERE name LIKE 'Fried____'` (devuelve resultados en los que comience con Fried y tenga 4 letras despues). Ideal para asegurar que tenga una cantidad determinada de caracteres

- `IS NULL` O `IS NOT NULL`: Devuelve los que son nulos o los que no son nulos

