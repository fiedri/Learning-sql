# Subconsulta  
Es una consulta dentro de otra. Produce resultados que usa la consulta principal. Solo recuperan datos.

---

## 1. Subconsulta en un SELECT  
Se usa para traer un valor calculado o relacionado en cada fila.

**Ejemplo:**
```sql
SELECT nombre, 
       (SELECT COUNT(*) 
        FROM pedidos 
        WHERE pedidos.cliente_id = clientes.id) AS total_pedidos
FROM clientes;
```
*Para cada cliente, muestra su nombre y el número de pedidos que tiene.*

---

## 2. Subconsulta en un FROM  
Crea una "tabla virtual" temporal para operar sobre ella.

**Ejemplo:**
```sql
SELECT departamento, promedio_salario
FROM (SELECT departamento, AVG(salario) AS promedio_salario
      FROM empleados
      GROUP BY departamento) AS resumen
WHERE promedio_salario > 3000;
```
*Crea una tabla temporal con el salario promedio por departamento y luego filtra los que superan 3000.*

## 3. Subconsultas en WHERE  
Filtran registros usando resultados de otra consulta como condición.

### 1. Con operadores de comparación (=, >, <)
```sql
SELECT nombre, precio
FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos);
```
*Productos con precio mayor al promedio.*

---

### 2. Con IN / NOT IN
```sql
SELECT nombre
FROM empleados
WHERE departamento_id IN (SELECT id 
                          FROM departamentos 
                          WHERE ciudad = 'Madrid');
```
*Empleados que trabajan en departamentos de Madrid.*

---

### 3. Con EXISTS / NOT EXISTS
```sql
SELECT nombre
FROM clientes c
WHERE EXISTS (SELECT 1 
              FROM pedidos p 
              WHERE p.cliente_id = c.id);
```
*Clientes que tienen al menos un pedido.*

---

## 3. Subconsultas por niveles  
Dependen de dónde estén anidadas:

**Escalar (un valor):**
```sql
SELECT nombre, precio
FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos);
```
*Subconsulta en WHERE que devuelve un solo valor (el precio promedio).*

**De lista (varios valores):**
```sql
SELECT nombre
FROM empleados
WHERE departamento_id IN (SELECT id 
                          FROM departamentos 
                          WHERE ciudad = 'Madrid');
```
*Subconsulta en WHERE que devuelve una lista de IDs.*


## Otros ejemplos de subconsultas

```SQL
SELECT ProductID,
(SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) as nombre,
SUM(Quantity) AS total_vendido,
(SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS precio,
(SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)) AS total_recaudado
FROM [OrderDetails] OD GROUP BY ProductID ORDER by total_recaudado DESC
```

## **Comparación directa:**

| Aspecto | SUBCONSULTA | JOIN |
|---------|------------|------|
| **Enfoque** | Consultas anidadas | Tablas unidas |
| **Resultado** | Usualmente parcial | Combinación completa |
| **Rendimiento** | Puede ser más lento si mal escrito | Generalmente más eficiente |
| **Legibilidad** | A veces menos clara | Más intuitiva |

---

## **¿Cuándo usar cada una?**

**Usa SUBCONSULTA cuando:**
- Necesitas un valor calculado (promedio, máximo, etc.) para filtrar
- Trabajas con condiciones EXISTS/NOT EXISTS
- Quieres evitar duplicados en casos específicos

**Usa JOIN cuando:**
- Necesitas combinar datos de múltiples tablas
- Quieres ver relaciones directamente en el resultado
- Buscas mejor rendimiento con tablas grandes
