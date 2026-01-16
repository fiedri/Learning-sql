# Problema del n+1
Es un problema de cuello de botella que aparece en las aplicaciones basadas en base de datos. Este problema sucede cuando se realizan multiples consultas pequeñas en secuencia para obtener los datos solicitados.

Las consultas en secuencia suelen utilizarse, cuando se necesita una lista de registro e informacion adicional sobre esos mismo registros. Se realizaria una consulta para obtener la lista de registro y luego una consulta por cada uno de esos registros, para obtener informacion adicional sobre ellos

## Ejemplo
En el desarrollo de una app de delivery de comidas haces una peticion para las primeras 50 ordenes en la base de datos. Primero, obtienes una lista de esas ordenes en una tabla `orders` como la siguiente

| order_id | product    | quantity | customer_id |
|---------:|:-----------|--------:|------------:|
| 1        | pizza      | 2       | 3422 |
| 2        | salad      | 1       | 1255 |
| 3        | ice cream  | 4       | 2344 |
| 4        | donuts     | 10      | 3455 |
|.         | ...      | .       | .    |
|.         | ...          | .       | .    |
|.         | ...          | .       | .    |

Pero que pasa si tambien necesitas los datos de los clientes que hicieron esas ordenes, la informacion estara guardada en una tabla diferente `customers`

Una forma de abordar esto sería obtener primero la lista de pedidos y luego ejecutar una consulta por pedido para obtener la información de los clientes. Para obtener la lista de pedidos, puedes ejecutar una consulta como esta, para obtener los primeros 50 registros de la tabla de pedidos:
```SQL
SELECT * FROM orders LIMIT 50;
```

De aquí viene el 1 en N+1. Es la consulta inicial la que te da la lista de registros. Luego, necesitarás realizar otra consulta para cada uno de estos registros para obtener la información del cliente que envió el pedido. Para ello, puedes escribir un bucle en una función asincrónica para procesar tanto pedidos como clientes. La función getCustomerData() realizará una consulta SQL para obtener los datos del cliente que realizó un pedido específico. Hará esto en una secuencia para cada pedido que se realizó:

```JavaScript
for (const order of orders) {
  const customerId = order.customer_id;
  const customerData = await getCustomerData(customerId);
  // Process the customer's data.
}
```

De ahí viene la N en N+1. N representa el número de consultas que se realizarán para obtener datos adicionales para cada uno de los registros.

Este enfoque puede parecer simple e intuitivo, pero quizás te sorprenda saber que esto es exactamente lo que no debes hacer. Debe evitar realizar consultas en un bucle porque realizar varias consultas pequeñas llevará mucho más tiempo que realizar una única consulta más grande para obtener todos los datos.

Deberías intentar utilizar las herramientas que te proporciona SQL para reducir al máximo el número de consultas. En este caso, podríamos utilizar una operación `JOIN` para unir la tabla de pedidos y clientes.
```SQL
SELECT 
  orders.order_id,
  orders.product,
  orders.quantity,
  customers.customer_id,
  customers.name AS customer_name,
  customers.email AS customer_email,
  customers.address AS customer_address
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
WHERE orders.order_id IN (SELECT order_id FROM orders LIMIT 50)
```

Con la operación JOIN podemos recuperar los datos de los primeros 50 pedidos de la base de datos, incluidos los datos de los clientes, sus nombres, correo electrónico y direcciones, con una sola consulta. Puede parecer más complejo, pero en realidad es más eficiente de esta manera.