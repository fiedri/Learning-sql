# Problema del n+1
Es un problema de cuello de botella que aparece en las aplicaciones basadas en base de datos. Este problema sucede cuando se realizan multiples consultas pequeñas en secuencia para obtener los datos solicitados.

Las consultas en secuencia suelen utilizarse, cuando se necesita una lista de registro e informacion adicional sobre esos mismo registros. Se realizaria una consulta para obtener la lista de registro y luego una consulta por cada uno de esos registros, para obtener informacion adicional sobre ellos