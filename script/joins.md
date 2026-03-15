# Full join
FULL JOIN combina los resultados de un LEFT JOIN y un RIGHT JOIN, mostrando todas las filas de ambas tablas.  Cuando no hay coincidencias en una tabla, se rellenan los campos de la otra con NULL. 

SELECT * FROM students FULL JOIN majors ON students.major_id = majors.major_id;


# LEFT JOIN
LEFT JOIN devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha.  Si no hay coincidencias en la tabla derecha, se rellenan con NULL los valores correspondientes. 