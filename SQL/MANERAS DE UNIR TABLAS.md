# Como unir tablas
Aunque la informacion en la base de datos se suele almacenar dentro de tablas diferentes. Las funciones `JOIN` de SQL nos permiten combinar informacion relacionada para consultar datos

## Tipos principales de `JOIN`s
- `INNER JOIN`
- `FULL OUTER JOIN`
- `LEFT OUTER JOIN`
- `RIGHT OUTER JOIN`
- `SELF JOIN`
- `CLOSS JOIN`

Entendido. Olvidamos el formato blog. Aquí tienes la explicación técnica pura y dura de cómo procesa el motor de base de datos cada comando, centrada en la lógica de conjuntos que es lo que te interesa como informático.

Imagina dos conjuntos de datos (tablas) con una columna en común (`id`).

* **Tabla A (Izquierda):** IDs `{1, 2}`
* **Tabla B (Derecha):** IDs `{2, 3}`

---

### 1. INNER JOIN (Intersección)
Es un filtro restrictivo. El motor busca **solo** los valores que existen en ambos conjuntos simultáneamente.
* **Lógica:** $A \cap B$
* **Resultado:** ID `{2}`.
* **Uso:** "Dame los datos que están confirmados en ambos lados". Si un ID está en A pero no en B, se descarta.

### 2. LEFT JOIN (Prioridad Izquierda)
El motor toma **toda** la tabla de la izquierda (A) como base indiscutible. Luego intenta "pegarle" los datos de la derecha (B).
* **Lógica:** Todo $A + (A \cap B)$.
* **Resultado:**
    * ID `1`: Existe en A, no en B $\rightarrow$ Muestra datos de A, rellena B con `NULL`.
    * ID `2`: Existe en A y en B $\rightarrow$ Muestra datos de ambos.
* **Clave:** Nunca pierdes filas de la tabla A.

### 3. RIGHT JOIN (Prioridad Derecha)
Es exactamente lo opuesto al LEFT. El motor toma la tabla derecha (B) como base.
* **Lógica:** Todo $B + (A \cap B)$.
* **Resultado:**
    * ID `2`: Existe en ambos $\rightarrow$ Muestra datos completos.
    * ID `3`: Existe en B, no en A $\rightarrow$ Muestra datos de B, rellena A con `NULL`.
* **Nota:** Casi no se usa en la práctica porque es más fácil leer de izquierda a derecha (usando LEFT JOIN).

### 4. FULL OUTER JOIN (Unión Completa)
El motor combina todo. No descarta nada.
* **Lógica:** $A \cup B$
* **Resultado:**
    * ID `1` (solo A, B es NULL).
    * ID `2` (ambos).
    * ID `3` (solo B, A es NULL).
* **Uso:** Auditorías o reportes donde necesitas ver qué falta en cada lado.

---

### 5. CROSS JOIN (Producto Cartesiano)
**Ojo con este.** Aquí no hay condición `ON`. El motor no busca coincidencias, simplemente combina "todos contra todos".
* **Lógica:** $A \times B$
* **Operación:** Multiplica el número de filas. Si A tiene 1,000 filas y B tiene 1,000, el resultado son 1,000,000 de filas.
* **Resultado (con nuestros IDs):**
    * 1 con 2
    * 1 con 3
    * 2 con 2
    * 2 con 3

### 6. SELF JOIN (Auto-referencia)
No es un comando especial, es una técnica. Usas un `INNER` o `LEFT JOIN` pero **la tabla se une consigo misma**.
* **Requisito:** Debes usar **Alias** obligatoriamente (ej: `Empleado AS E` y `Empleado AS Jefe`) para que el motor sepa qué "versión" de la tabla es cual.
* **Lógica:** Comparar filas dentro de la misma estructura.
* **Ejemplo real:** Tienes una tabla `Personas`. Quieres buscar parejas donde la `Persona A` tenga el mismo apellido que la `Persona B`.