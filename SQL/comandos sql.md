 ## Comando para usuarios y roles 
| Propósito | Comando SQL | Ejemplo |
| :--- | :--- | :--- |
| **Crear un Nuevo Usuario** (con permiso para iniciar sesión) | `CREATE ROLE nombre_usuario WITH LOGIN PASSWORD 'contraseña';` | `CREATE ROLE mi_dev WITH LOGIN PASSWORD 's3gura123';` |
| **Crear un Role de Grupo** (sin permiso de login, para agrupar usuarios) | `CREATE ROLE nombre_del_grupo;` | `CREATE ROLE readonly_users;` |
| **Asignar un Role a un Usuario** (o añadir a un grupo) | `GRANT nombre_del_grupo TO nombre_usuario;` | `GRANT readonly_users TO mi_dev;` |
| **Eliminar un Usuario/Role** | `DROP ROLE nombre_usuario;` | `DROP ROLE mi_dev;` |
| **Cambiar la Contraseña** | `ALTER ROLE nombre_usuario WITH PASSWORD 'nueva_contraseña';` | `ALTER ROLE mi_dev WITH PASSWORD 'mas_segura456';` |



***

## ⚙️ Comandos SQL para Bases de Datos (Database)

| Propósito | Comando SQL | Ejemplo |
| :--- | :--- | :--- |
| **Crear una Base de Datos** | `CREATE DATABASE nombre_bd;` | `CREATE DATABASE blog_informatica;` |
| **Crear una BD y Asignar Propietario** | `CREATE DATABASE nombre_bd OWNER nombre_usuario;` | `CREATE DATABASE blog_informatica OWNER mi_dev;` |
| **Asignar Propietario (OWNER)** de una BD existente | `ALTER DATABASE nombre_bd OWNER TO nombre_usuario;` | `ALTER DATABASE blog_informatica OWNER TO mi_dev;` |
| **Eliminar una Base de Datos** | `DROP DATABASE nombre_bd;` | `DROP DATABASE blog_informatica;` |
| **Conectarse a una BD** (desde `psql`) | `\c nombre_bd` | `\c blog_informatica` |

***

## 🚦 Comandos SQL para Permisos (Privileges)

| Propósito | Comando SQL | Ejemplo |
| :--- | :--- | :--- |
| **Otorgar todos los permisos** en una BD | `GRANT ALL PRIVILEGES ON DATABASE nombre_bd TO nombre_usuario;` | `GRANT ALL PRIVILEGES ON DATABASE blog_informatica TO mi_dev;` |
| **Revocar permisos** de conexión | `REVOKE CONNECT ON DATABASE nombre_bd FROM nombre_usuario;` | `REVOKE CONNECT ON DATABASE blog_informatica FROM mi_dev;` |
| **Otorgar permiso SELECT** en una tabla | `GRANT SELECT ON TABLE nombre_tabla TO nombre_usuario;` | `GRANT SELECT ON TABLE articulos TO readonly_users;` |


## Tablas
ejemplo de como crear tablas
```bash
CREATE TABLE products (
  id SERIAL,
  name VARCHAR(255)
);
```