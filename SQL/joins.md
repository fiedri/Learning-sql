# JOins
Nos permite combinar 2 o mas tablas unirlas para obtener la informacion en una sola tabla

## Tipos de joins
### Inner join
Devuelve la coincidencia entre ambos, se usa `ON` en lugar de where
```SQL
SELECT * FROM Employees e INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
```

### Cross Join
combina cada fila de una tabla con cada fila de otra tabla, generando un producto cartesiano.




## Producto Cartesiano en Bases de Datos
### Definición
Es el resultado de combinar cada fila de una tabla con cada fila de otra tabla, sin filtros ni condiciones.