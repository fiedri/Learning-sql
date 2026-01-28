# Group by
Esta clausula se usa para agrupar uno o varios registros segun uno o varios valores de las columnas
Para entender el `GROUP BY`, lo mejor es imaginar que tienes una lista desordenada de ventas y quieres **agruparlas** para obtener un resumen por categoría. Básicamente, transforma muchas filas individuales en una sola fila por cada grupo.

Imagina que tienes esta tabla llamada `ventas`:

| producto | categoria | precio |
| --- | --- | --- |
| Teclado | Periféricos | 30 |
| Mouse | Periféricos | 15 |
| Monitor | Pantallas | 200 |
| Webcam | Periféricos | 50 |
| Monitor 4K | Pantallas | 400 |

### El ejemplo de la consulta

Si quieres saber cuánto dinero has ganado por cada **categoría**, usarías esta sentencia:

```sql
SELECT categoria, SUM(precio) AS total_vendido
FROM ventas
GROUP BY categoria;

```

### ¿Qué sucede internamente?

1. **Agrupación:** El motor de la base de datos busca todos los valores iguales en la columna `categoria`.
2. **Cálculo (Agregación):** Aplica una función (como `SUM`, `COUNT` o `AVG`) sobre los datos de cada grupo.
3. **Resultado:** Te devuelve una fila por cada grupo encontrado.

**El resultado sería:**

| categoria | total_vendido |
| --- | --- |
| Periféricos | 95 |
| Pantallas | 600 |


# HAVING
Permite agregar condiciones en funciones de agregacion, ideal para cuando se trabaja con grupos