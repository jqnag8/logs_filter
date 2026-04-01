#!/bin/bash

# Ejercicio 1
echo "--- Top de IP's por cantidad de requests ---"

cut "$1" -d ' ' -f 1 | sort | uniq -c | sort -nr 

# Ejercicio 2
echo ""
echo "--- Requests Fallidas ---"

cut -d ' ' -f 1,6,7,8,9 "$1" | grep -E " 4[[:digit:]]{2}" | tr '"' '\t'

# Ejercicio 3
echo ""
echo "--- Recurso mas solicitado ---"

grep "\"GET " "$1" | cut -d ' ' -f 7 | sort | uniq -c | sort -nr | head -n 3

# Version Generalizada
# read -p "Ingrese el método a buscar: " var && grep "\"$var " "$1" | cut -d ' ' -f 7 | sort | uniq -c | sort -nr | head -n 3
