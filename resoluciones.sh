# /bin/bash

echo "Resolucion de ejercicio 1"

cut logs.txt -d ' ' -f 1 | # Separamos los campos para aislar las IP's de cada log para obtener
  # una lista de apariciones de cada IP
  uniq -c |  # Enumeramos la cantidad de veces que aparece cada IP a partir de las
  # lineas del resultado anterior
  sort -r # Ordenamos los resultados a partir de la numeracion inicial
  # de forma inversa ya que sort por default las ordena de menor a mayor
