#! /bin/bash

if [ ! -e $1 ]; then
  echo "Archivo no encontrado" && exit 1
fi


ip_list=$(cut -d ' ' -f 1 $1 | sort | uniq) 

echo "== Reporte de $1 =="

for ip in $ip_list; do
  ip_requests=$(grep -w "$ip" "$1") 
  ip_total_requests=$(echo "$ip_requests" | wc -l) 
  ip_errors=$(echo "$ip_requests" | cut -d ' ' -f 9 | grep -E 4[[:digit:]]{2} | wc -l) 

  echo -e "IP: $ip\t|\tRequests: $ip_total_requests\t|\tFallidos: $ip_errors"
done 
