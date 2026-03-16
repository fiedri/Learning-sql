#!/bin/bash
# Definimos la constante con mayúsculas, como un estándar de mando
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# 1. Validación de entrada inmediata
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# 2. Consulta optimizada (Agregamos alias y claridad)
# Usamos el casting ::text para evitar errores de tipo si $1 es un string
QUERY="SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type 
       FROM elements e 
       JOIN properties p USING(atomic_number) 
       JOIN types t USING(type_id) 
       WHERE e.atomic_number::text = '$1' OR e.symbol = '$1' OR e.name = '$1';"

RESULTADO=$($PSQL "$QUERY")

# 3. Manejo de errores y salida
if [[ -z $RESULTADO ]]; then
  echo "I could not find that element in the database."
else
  # Usamos IFS localmente para no ensuciar el entorno global
  IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING TYPE <<< "$RESULTADO"
  
  # Usamos una sola línea de salida limpia
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING celsius."
fi