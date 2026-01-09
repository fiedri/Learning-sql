# QUe es la normalizacion
Se trata del proceso de organizar las bases de datos relacionales mediante formas establecidas usadas para reducir la redundancia de datos y mejorar la integridad de los mismos.
Debes analizar los atributos y relaciones en las estructuras de las tablas para identificar oportunidades de simplificacion basado en las reglas de normalizacion, luego divides la informacion en tablas mucho mas pequeñas, estableciendo entre si relaciones utilizando las llaves primarias y externas.
Este Proceso permite reducir el espacio y manejar insconsistencias, preservar la integridad de los datos, las reglas que utilizas para normalizar los datos se llaman Normal forms

# Primera Normal forms (1NF):
- Cada celda debe contener solo un valor. POr ejemplo en una tabla de estudiantes, un estudiante puede tener mas de un numero, para guardar estos numeros podemos crear una tabla separada que liste cada numero en una sola celda, una tabla para los numeros de los estudiantes
- Cada fila debe ser unica
- El orden de las filas y columnas no debe de ser relevante.

# Segunda Normal forms (2nf):
La segunda forma funciona encima de la primera forma, por lo que se necesitan que se cumplan todas las reglas de esta ultima para poder utilizarlas
Para entender esta forma se requiere familiaridad con 2 conceptos claves: superkeys y candidate keys:
- una superkey es un conjunto de atributos que unicamente identifica cada fila en una tabla, lo que significa que 2 filas no pueden tener el mismo valor en la columna de la superkey, como por ejemplo un id, una tabla puede tener varias superkeys
- Una candidate key se define como una superkey minimalista que posee la capacidad de identificar de forma única cada registro en una tabla sin incluir atributos redundantes. Mientras que una superkey puede contener columnas adicionales innecesarias para la identificación, como el nombre de un usuario junto a su ID, la clave candidata se rige por el principio de minimalidad, manteniendo únicamente los campos estrictamente esenciales que garantizan la unicidad. De este modo, aunque una tabla puede contar con múltiples claves candidatas que funcionen como "finalistas" de identificación, el programador debe seleccionar una sola de ellas para que desempeñe el rol de clave primaria.

La segunda forma se trata de que cada dato este en su lugar correcto y que no se repita tontamente. Busca eliminar las dependencias parciales. Estas ocurren cuando tienes una clave primaria compuesta (hecha de 2 o mas columnas), y una columna dentro de la tabla depende de una sola parte de esa llave, en lugar de depender de la combinacion completa

## Ejemplo
### El problema
Una tabla con la siguiente forma: `ID_FACTURA` + `ID_FRANELA` | `FECHA` | `CIUDAD_DE_ENVIO` | `TALLA`

- Para crear la primary key utilizas el ID_FACTURA y el ID_FRANELA (porque en una sola factura puede haber varias franelas)
- Pero hay un fallo, y es que se produce una dependencia parcial con el campo CIUDAD_DE_ENVIO ya que esta solamente depende de la factura, no de la franela

### La solucion
Se divide la tabla para que cada dato dependa de la llave completa:
1. Tabla de facturas: `ID_FACTURA` | `FECHA` | `CIUDAD DE ENVIO`
2. Tabla de datos: `ID_FACTURA` | `ID_FRANELA` | `TALLA`


# Tercera forma normal (3nf)
Para implementar la 3nf, primero se debio de haber implementado la segunda:
- Todos los atributos que no son claves dependan completamente de la clave primaria, estos no deberian de depender de otros atributos

Para entender la Tercera Forma Normal (3NF), necesitas entender las dependencias transitivas. Una dependencia transitiva ocurre cuando un atributo que no forma parte de la clave primaria depende de otro atributo que tampoco forma parte de la clave primaria, el cual, a su vez, depende de la clave primaria.

Por ejemplo, modifiquemos nuestra tabla de **órdenes** para que tenga estas columnas:

`order_id` | `customer_id` | `customer_city` | `city_postal_code` | `order_date` | `quantity`

La clave primaria en esta nueva tabla es `order_id` porque identifica de forma única cada fila.

Existe una **dependencia transitiva** en esta tabla:

`order_id` > `customer_id` > `customer_city` > `city_postal_code`

El código postal de la ciudad está determinado por la ciudad del cliente, la cual está determinada por el ID del cliente, el cual a su vez está determinado por el ID de la orden. El código postal (`city_postal_code`), un atributo que no forma parte de la clave primaria, es determinado por la ciudad (`customer_city`), que tampoco es parte de la clave primaria; pero la ciudad es determinada por el `order_id` a través del `customer_id`.

Esto significa que el código postal de la ciudad se repetirá para cada orden realizada por clientes que vivan en la misma ciudad. Esto conducirá a la **redundancia de datos**. Además, cualquier cambio en el código postal de una ciudad requeriría actualizaciones en múltiples registros.

Para solucionar la dependencia transitiva, necesitarías dividir la tabla en varias tablas. Primero, una tabla de **órdenes**:

`order_id` | `customer_id` | `order_date` | `quantity`

Luego, una tabla de **clientes**:

`customer_id` | `city_name`

Y una tabla de **ciudades**:

`city_name` | `city_postal_code`

Esto elimina la dependencia transitiva de la tabla.

# Forma normal de Boyce-Codd (BCNF)
Para implementar esta forma se debe:
- Haber implementado la tercera forma
- Hacer que cada lado izquierdo de una dependencia funcional sea una superkey

El objetivo de esta forma normal es asegurar que cada atributo o conjunto de atributos que determine a otro atributo sea una superkey (que es una clave candidata o un superconjunto de ellas).

Comprender y aplicar las formas normales es esencial para diseñar bases de datos relacionales robustas y eficientes. Al eliminar la redundancia de datos y asegurar dependencias lógicas, la normalización conduce a una mejor integridad de los datos, requisitos de almacenamiento reducidos y un mantenimiento de la base de datos simplificado. Por lo general, deberías aspirar a alcanzar la Tercera Forma Normal (3NF)."