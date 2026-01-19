# Que son las claves primarias y externas y como funcionan?
Son usadas para establecer relacion entre tablas

## Claves primarias
Es una columna o un conjunto de columnas que identifican de manera unica cada fila. Lo que a asegura que cada fila en la tabla no tendra el mismo valor de clave primaria. Los valores dentro de una clave primaria no pueden ser `NULL`, por lo que siempre tendran un valor valido, para crear una clave primaria necesitas agregar `PRIMARY KEY` despues del tipo de dato
 ```SQL
 column_name data_type PRIMARY KEY
 ```
 EJEMPLO:
 ```SQL
 CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);
 ```
### Claves primarias compuestas
Una **Clave Primaria Compuesta** es una clave primaria que se forma **combinando dos o más columnas** en una tabla.

Su propósito principal sigue siendo el mismo que el de una clave primaria simple:

1.  **Identificar de forma única** cada fila (registro) en la tabla.
2.  **Garantizar la integridad de la entidad** (no permite duplicados ni valores nulos en la combinación de las columnas).

#### La Regla de Oro

La clave está en que **ninguna de las columnas por sí sola es suficiente** para identificar la fila, pero **la combinación de sus valores sí lo es**.

-----

#### 💡 ¿Cuándo se utiliza?

Este tipo de clave se usa frecuentemente para modelar relaciones de **Muchos a Muchos (M:N)** o para tablas que representan eventos o asociaciones.

El escenario más común es una **Tabla de Asociación** o **Tabla Intermedia**.

##### Ejemplo Práctico: Inscripción a Cursos

Imagina un sistema de gestión de estudiantes y cursos. Necesitas una tabla que registre **qué estudiante está inscrito en qué curso**.

1.  **Tabla `Estudiantes`**: `id_estudiante` (PK simple)
2.  **Tabla `Cursos`**: `id_curso` (PK simple)
3.  **Tabla de Asociación `Inscripciones`**:

| Columna | Tipo de Clave | Descripción |
| :--- | :--- | :--- |
| **`id_estudiante`** | Clave Foránea (FK) | ID del estudiante. |
| **`id_curso`** | Clave Foránea (FK) | ID del curso. |
| *`fecha_inscripcion`* | Atributo normal | Fecha en que se inscribió. |

En la tabla `Inscripciones`, la **Clave Primaria Compuesta** es la combinación de: **(`id_estudiante`, `id_curso`)**.

  * **¿Por qué es Compuesta?** Un estudiante (`id_estudiante = 101`) puede estar inscrito en varios cursos. Un curso (`id_curso = 50`) puede tener varios estudiantes.
  * **La Restricción:** Lo que no puede ocurrir es que el mismo estudiante (`101`) se inscriba **dos veces** en el mismo curso (`50`). La combinación `(101, 50)` solo puede aparecer una vez.

-----

#### 💻 Implementación en SQL (PostgreSQL)

En PostgreSQL, defines la clave compuesta al final de la sentencia `CREATE TABLE`, especificando las columnas entre paréntesis:

```sql
CREATE TABLE Inscripciones (
    id_estudiante INT NOT NULL REFERENCES Estudiantes(id_estudiante),
    id_curso INT NOT NULL REFERENCES Cursos(id_curso),
    fecha_inscripcion DATE,

    -- Definición de la Clave Primaria Compuesta
    PRIMARY KEY (id_estudiante, id_curso)
);
```

Este comando le indica a PostgreSQL que la unicidad de las filas se basa en la combinación de los valores en las dos columnas listadas.

## Claves Externas
Es una columna o conjunto de columnas que hace referencia a la clave primaria de otra tabla, una tabla puede tener multiples claves externas
```SQL
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  ...
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  ...
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```
