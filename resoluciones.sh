#!/bin/bash

if [ ! -e $1 ]; then
  echo "Archivo no encontrado." && exit 1
fi

# Ejercicio 1
echo "--- Top de IP's por cantidad de requests ---"

echo
echo "Primer etapa:"
cut "$1" -d ' ' -f 1 # Se aislan las IP's

echo
echo "Segunda etapa:"
cut "$1" -d ' ' -f 1 | sort # Se ordenan para aplicar el uniq luego

echo
echo "Tercer etapa:"
cut "$1" -d ' ' -f 1 | sort | uniq -c

echo
echo "Pipeline completo:"
cut "$1" -d ' ' -f 1 | sort | uniq -c | sort -nr # Se ordenan numéricamente de mayor a menor para crear el top

echo
# Ejercicio 2
echo 
echo "--- Requests Fallidas ---"

echo
echo "Primer etapa:"
cut -d ' ' -f 1,6,7,8,9 "$1" # Se aislan las ips, recurso y codigo de salida

echo
echo "Segunda etapa:"
cut -d ' ' -f 1,6,7,8,9 "$1" | grep -E " 4[[:digit:]]{2}" # Se filtran los codigos de error

echo
echo "Pipeline completo"
cut -d ' ' -f 1,6,7,8,9 "$1" | grep -E " 4[[:digit:]]{2}" | tr '"' '\t'

# Ejercicio 3
echo 
echo "--- Recursos mas solicitados ---"

echo
echo "Primer etapa:"
grep "\"GET " "$1" # Se filtran los logs donde se use un POST

echo
echo "Segunda etapa:"
grep "\"GET " "$1" | cut -d ' ' -f 7 # Se aislan los recursos (paths)

echo
echo "Tercer etapa:"
grep "\"GET " "$1" | cut -d ' ' -f 7 | sort | uniq -c | sort -nr

echo
echo "Pipeline completo:"
grep "\"GET " "$1" | cut -d ' ' -f 7 | sort | uniq -c | sort -nr | head -n 3

echo
echo "(Version Alternativa)"
# Version Generalizada
read -p "Ingrese el método a buscar: " var && grep "\"$var " "$1" | cut -d ' ' -f 7 | sort | uniq -c | sort -nr | head -n 3
