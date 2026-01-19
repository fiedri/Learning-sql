# Tipos de relaciones
1. uno a uno
2. uno a muchos
3. muchos a uno
4. muchos a muchos
5. Relacionamiento autoreferencial (tambien conocidas como relacionamiento recursivo) 

### 1. Uno a Uno (1:1)
Un registro de la Tabla A se relaciona únicamente con un registro de la Tabla B, y viceversa. Es poco común (a menudo se pueden fusionar las tablas), pero útil para separar datos sensibles o dividir tablas enormes.

* **Ejemplo:** `Usuario` ↔ `Perfil_Configuracion` (Un usuario tiene una sola configuración; esa configuración pertenece a un solo usuario).
* **Implementación:** La FK puede ir en cualquiera de las dos tablas, pero debe tener una restricción `UNIQUE` para evitar duplicados.



### 2. Uno a Muchos (1:N)
Es la relación más común. Un registro de la Tabla A puede relacionarse con muchos registros de la Tabla B. Pero un registro de la Tabla B solo pertenece a un registro de la Tabla A.

* **Ejemplo:** `Usuario` ↔ `Pedidos` (Un usuario hace muchos pedidos; un pedido específico pertenece a un solo usuario).
* **Implementación:** La FK **siempre** va en la tabla del lado "Muchos" (Tabla B).
    * En este caso, la tabla `Pedidos` lleva la columna `usuario_id`.



### 3. Muchos a Muchos (N:M)
Un registro de la Tabla A se relaciona con muchos de la Tabla B, y un registro de la Tabla B se relaciona con muchos de la Tabla A.

* **Ejemplo:** `Estudiantes` ↔ `Clases` (Un estudiante ve muchas clases; una clase tiene muchos estudiantes).
* **Implementación:** **No se puede hacer directamente**. Necesitas obligatoriamente una **Tabla Intermedia** (o pivote).
    * La tabla intermedia contiene dos FKs: una apuntando a A y otra apuntando a B. La combinación de ambas suele ser la Primary Key compuesta.


### 4. Auto-referencial (Recursiva / Unaria)
Es una relación donde una tabla se vincula consigo misma. Técnicamente, suele comportarse como una relación **1:N** interna.

* **Lógica:** Un registro (fila) de la tabla hace referencia a otro registro dentro de la **misma** tabla.
* **Ejemplo Clásico:**
    * **Empleados:** Un empleado tiene un supervisor. Ese supervisor también es un empleado que está en la misma tabla.
    * **Categorías:** Una subcategoría (ej. "Laptops") pertenece a una categoría padre (ej. "Computación"), ambas están en la tabla `Categorías`.
* **Implementación:**
    * Creas una columna **Foreign Key** dentro de la tabla que apunta a la **Primary Key** de esa misma tabla.
    * **Dato clave:** Esta columna FK casi siempre debe permitir valores **NULL** (para el registro raíz de la jerarquía, por ejemplo, el CEO que no tiene jefe, o la categoría principal que no tiene padre).



[Image of self referencing database table diagram]
