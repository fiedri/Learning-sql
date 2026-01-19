# Crear una base de datos con postgresql en linux y conectarla con pgadmin

## 💾 Parte 1: Creación de la Base de Datos en la Terminal (Linux)

Asumiré que ya tienes PostgreSQL instalado en tu distribución Linux.

-----

### Paso 1: Acceder a la cuenta de usuario `postgres`

Durante la instalación, PostgreSQL crea un usuario de sistema llamado `postgres` que es el superusuario de la base de datos. Debes cambiar a este usuario para interactuar con el servidor.

```bash
sudo -i -u postgres
```

*(Si ya eres el usuario `postgres`, puedes omitir este paso.)*

-----

### Paso 2: Acceder a la Interfaz de Línea de Comandos de PostgreSQL (`psql`)

Una vez como usuario `postgres`, ejecutas el cliente `psql` para entrar a la interfaz interactiva.

```bash
psql
```
-----

### Paso 3: Crear un Nuevo Usuario (Role) para la Base de Datos

Es una **buena práctica** no usar el usuario `postgres` para todo. Crea un usuario específico (un "role" en la jerga de PostgreSQL) y asigna una contraseña.

```sql
CREATE ROLE mi_usuario WITH LOGIN PASSWORD 'mi_contraseña_segura';
```

> **Nota:** Reemplaza `mi_usuario` y `mi_contraseña_segura` por los valores que desees.

-----

### Paso 4: Crear la Base de Datos

Ahora crea la base de datos y asigna el nuevo usuario como su propietario (`OWNER`).

```sql
CREATE DATABASE mi_nueva_bd OWNER mi_usuario;
```

> **Nota:** Reemplaza `mi_nueva_bd` por el nombre de tu base de datos.

-----

### Paso 5: Otorgar Permisos al Usuario

Asegúrate de que el usuario tenga los permisos necesarios sobre la base de datos (por ejemplo, el permiso para crear esquemas).

```sql
GRANT ALL PRIVILEGES ON DATABASE mi_nueva_bd TO mi_usuario;
```

-----

### Paso 6: Salir de `psql` y de la cuenta `postgres`

Para volver a tu usuario de sistema normal, simplemente escribe `\q` en `psql` y luego `exit` en el shell del usuario `postgres`.

```sql
\q
```

```bash
exit
```

-----

**NOta:** si ya tienes un usuario configurado y base de datos
```bash
psql -U <username> -d <database_name>
```

## El Flujo de Trabajo Resumido
Tu explicación capta la esencia del proceso en Linux:

1. `sudo -i -u postgres`: Este comando te permite asumir la identidad del usuario del sistema operativo que es el superusuario de PostgreSQL. Es como obtener la "llave maestra" del servidor. Una vez dentro de esa shell (terminal), estás operando como el administrador del sistema de bases de datos.

    - (Aquí NO estás aún en la base de datos, sino en la terminal del usuario postgres.)

2. `psql`: Al ejecutar esto como el usuario postgres, inicias el cliente de línea de comandos de PostgreSQL y te conectas automáticamente a la base de datos por defecto (postgres o la base de datos con el mismo nombre que el usuario). Desde aquí, usando comandos SQL, puedes realizar tareas administrativas de alto nivel como crear bases de datos (CREATE DATABASE) y gestionar roles/usuarios (CREATE ROLE).

3. `psql -U <username> -d <name_database>`: Este es el paso clave para el uso diario. Una vez que has preparado la base de datos y el usuario con permisos limitados (es decir, ya no como superusuario postgres), este comando te permite conectar directamente al servidor de PostgreSQL con ese usuario y a esa base de datos específica, sin necesidad de ser el usuario postgres del sistema.




## 🛠️ Parte 2: Conexión desde PgAdmin 4

Una vez que la base de datos y el usuario están creados, puedes conectarte con el cliente gráfico.

-----

### Paso 1: Abrir PgAdmin 4

Abre la aplicación PgAdmin 4 en tu escritorio (Linux o donde lo tengas instalado).

-----

### Paso 2: Agregar un Nuevo Servidor

1.  Haz clic derecho en **"Servers"** (Servidores) en el panel de la izquierda.
2.  Selecciona **"Create"** (Crear) -\> **"Server..."** (Servidor...).

-----

### Paso 3: Configurar la Pestaña "General"

  * **Name (Nombre):** Asígnale un nombre descriptivo para ti, por ejemplo, `Mi BD Local`.

-----

### Paso 4: Configurar la Pestaña "Connection" (Conexión)

Aquí es donde usas la información que creaste en la terminal.

  * **Host name/address:** Para una base de datos en tu misma máquina, usa `localhost` o `127.0.0.1`.
  * **Port:** El puerto por defecto es **5432**.
  * **Maintenance database:** Generalmente se usa `postgres`.
  * **Username (Nombre de usuario):** Ingresa el nombre de usuario que creaste en el Paso 3: `mi_usuario`.
  * **Password (Contraseña):** Ingresa la contraseña que definiste: `mi_contraseña_segura`.

-----

### Paso 5: Guardar y Conectar

Haz clic en **"Save"** (Guardar). PgAdmin 4 intentará conectarse. Si todo está correcto, el servidor aparecerá en la lista. Puedes expandir el servidor, luego **"Databases"** (Bases de datos) y verás `mi_nueva_bd`, a la que podrás acceder y empezar a trabajar.

¡Y eso es todo\! Ya tienes tu base de datos **creada en la terminal** y estás **conectado desde PgAdmin 4**.

-----