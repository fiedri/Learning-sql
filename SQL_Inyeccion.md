# que es una inyeccion sql?
En la seguridad web es una vulnerabilidad, donde los atacante cambian o toman ventajas de las consultas que la pagina web hace a la base de datos. Por ejemplo un atacante puede introducir codigo malicioso de sql dentro de la consulta para correr
Esto puede pasar en formularios de registro, barras de busquedas o parametros de url utilizando los inputs de usuario o parámetros de URL y luego usar esa entrada del usuario en interpolación o concatenación de cadenas para generar el comando SQL final.
Con una sql injection se pueden lograr las siguientes cosas:
- eludir la autenticacion.
- Robar datos de la base de datos
- Modificar o eliminar registros de la base de datos, etc

# Ejemplo
Si tu aplicacion hace una consulta como esta para autenticar el usuario, incorporando directamente el nombre de usuario y la contraseña ingresados por el usuario:
```SQL
'SELECT * FROM users WHERE username = ' + username_input + ' AND password = ' + password_input + ';'
```

Si un atacante introduce lo siguiente:
```SQL
'" " OR "1"="1" --'
```
Y cualquier otra cosa en el campo de contraseña, dado que "1"="1" siempre es verdadero y -- comenta el resto de la consulta, la cláusula WHERE se convierte en:
```SQL
WHERE username = " " OR TRUE
```
Lo cual siempre sera `true`.
Dependiendo de la implementacion de la base de datos, esto puede devolver el primer usuario o cualquier usurio en la base de datos y permitiendo al usuario logearse sin necesidad de credenciales validas

# Principales maneras de prevenir una injeccion sql
- No escribir consultas dinamicas con concatenacion de strings
- evitar que se incluyan entradas SQL maliciosas en las consultas que se ejecutarán en el backend.

---
En la práctica, puedes utilizar declaraciones parametrizadas, también conocidas como consultas parametrizadas. Separan la estructura SQL de los datos ingresados por el usuario, lo que impide que la base de datos interprete los datos de entrada como código ejecutable.
Otra técnica importante es la validación de entrada. Esto se recomienda como medida de seguridad secundaria en todos los casos, pero es especialmente importante para partes de consultas SQL relacionadas con nombres de tablas, nombres de columnas y orden de clasificación. Si es posible, se recomienda asignar nombres de tablas y columnas directamente dentro de su código, no a partir de la entrada del usuario.

Si, a pesar de todas las medidas preventivas, sufre un ataque de inyección SQL, puede minimizar su impacto en la base de datos limitando los permisos de cada cuenta de la base de datos. Otorgue a cada usuario de la base de datos sólo los permisos necesarios para sus tareas, pero nada más. Si una cuenta solo necesita leer datos de la base de datos, concédele acceso de lectura únicamente. Y como medida preventiva, nunca asigne permisos de administrador a las cuentas de su aplicación. Es muy peligroso hacerlo porque un atacante podría obtener acceso completo y control total sobre la base de datos.
