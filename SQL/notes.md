# Que son las base de datos relacionales
Las base de datos relacionales organizan sus datos dentro de tablas conformadas por filas y columnas. Las filas sirven para guardar registros individuales, mientras que las columnas guardan atributos que describen a cada registro individual de la fila. Ejemplo: una base de datos en donde cada fila representa un usuario y cada columna son los campos que describen a ese usuario, puede ser el nombre, numero de telefono, etc.
Estas se relacionan por permitir la conexion de diferentes piezas de informacion mediante el enlace de tablas a travez de atributos en comun
## Claves
Todas las tables en una base de datos relacional continenen una *clave primaria*, la cual es un identificador unico para cada fila. Lo que hace posible hacer la relacion entre distintas tablas utilizando *claves externas* o *claves foraneas* que son atributos en una table que hacen referencia a la *clave primaria* de otra tabla.
### Ejemplo
Una base de datos con 2 tablas: una para registrar la informacion de los **clientes** y otra para registrar sus **pedidos**
#### Tabla 1: Clientes
|ID_Cliente (Clave Primaria)|Nombre|Ciudad|
|---------------------------|------|------|
|101|Juan|Maracaibo|
|102|María|Valencia|
|103|Carlos|Coro|
- El campo `ID_Cliente` es la **Clave Primaria (Primary Key)**. Esto significa que identifica de forma única a cada cliente. No puede haber dos clientes con el `ID_Cliente` 101.

#### Tabla 2: Pedidos
|ID_Pedido (Clave Primaria)|Producto|Cantidad|ID_Client (Clave Externa)|
|--------------------------|--------|-----|-----------|
|P001|Laptop|1|101|
|P002|Mouse|2|103|
|P003|Teclado|1|101|
|P004|Monitor|1|102|

La relacion (Integridad Referencial): La **Clave Externa** (`ID_Cliente` en la tabla `Pedidos`) apunta a la **Clave Primaria** (`ID_Cliente` en la tabla `Clientes`).

1.  **Vínculo:** El pedido **P001** y el pedido **P003** tienen el valor **101** en su Clave Externa, lo que los vincula directamente a "Juan" en la tabla `Clientes`.
2.  **Garantía de Validez:** La Clave Externa asegura la **Integridad Referencial**. Esto significa que:
    * No se puede ingresar un pedido con un `ID_Cliente` (ej. **104**) si ese ID no existe primero como Clave Primaria en la tabla `Clientes`.
    * No se puede eliminar al cliente **101** ("Juan") de la tabla `Clientes` si todavía existen pedidos (P001, P003) asociados a él en la tabla `Pedidos`.

## Queries o Consultas
Una query o consulta es una peticion especifica de datos de la base de datos. Ejemplos de consultas que podrías realizar en el contexto de nuestro ejemplo serían: encontrar todos los productos que ha comprado el cliente Juan, averiguar qué cliente realizó el pedido P002, contar cuántos artículos se han vendido en total, y más.

## Diferenciación Rápida con Bases de Datos No Relacionales (NoSQL)
Las bases de datos relacionales son ideales para datos estructurados donde la consistencia y la integridad de las relaciones son críticas (como en la banca o transacciones).

Por otro lado, las bases de datos no relacionales (NoSQL) almacenan los datos en formatos más flexibles (documentos, clave-valor) y no dependen de un esquema rígido ni de relaciones estrictas. Esto las hace más adecuadas para manejar grandes volúmenes de datos que cambian constantemente o que tienen una estructura impredecible.

## Algunas base de datos relacionales
Las base de datos relacionales mas comunes son: **MySQL, PostgreSQL, SQLite, and Microsoft SQL Server**
- **MySQL**: Es una base de datos de código abierto, popular para el desarrollo web por ser fácil de usar y eficiente en la construcción de aplicaciones del mundo real. Es la opción dominante en el stack LAMP (Linux, Apache, MySQL, PHP/Python/Perl).
- **PostgreSQL**: Conocida como la base de datos relacional de código abierto más avanzada del mundo. Se destaca por su robustez, fiabilidad y su cumplimiento estricto de estándares SQL. Es ideal para aplicaciones empresariales complejas y manejo de datos geoespaciales (PostGIS).
- **SQLite**: Es una base de datos liviana y sin servidor (serverless) de código abierto. Almacena la base de datos completa en un solo archivo en disco, lo que la hace perfecta para aplicaciones móviles, de escritorio o como caché local, ya que no requiere un proceso de servidor separado.
- **Microsoft SQL Server**: Es un sistema de gestión de bases de datos relacionales desarrollado por Microsoft. Es una solución comercial y escalable, muy utilizada en entornos empresariales de mediana y gran escala que dependen de la suite de tecnologías de Microsoft (como .NET o Azure). 