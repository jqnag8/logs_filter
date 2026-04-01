#! /bin/bash

if [ ! -e $1 ]; then
  echo "Archivo no encontrado" && exit 1 # si el archivo no existe, retorna error
fi


ip_list=$(cut -d ' ' -f 1 $1 | sort | uniq) # Lista de IP's unicas

echo "== Reporte de $1 =="

for ip in $ip_list; do
  ip_requests=$(grep -w "$ip" "$1") # Requests de la IP
  ip_total_requests=$(echo "$ip_requests" | wc -l) # Cantidad de requests de la IP
  ip_errors=$(echo "$ip_requests" | cut -d ' ' -f 9 | grep -E 4[[:digit:]]{2} | wc -l) # Cantidad de errores de la IP

  echo -e "IP: $ip\t|\tRequests: $ip_total_requests\t|\tFallidos: $ip_errors"
done 
