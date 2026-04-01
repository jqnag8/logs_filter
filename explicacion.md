# Resoluciones de ejercicios 1, 2 y 3


## Top de IP's por Cantidad de Requests

`cut "$1" -d ' ' -f 1 | sort | uniq -c | sort -nr`

* Utilizamos el comando `cut` para aislar las IP's.
* Luego, usamos el comando `sort` para que las IP's repetidas queden contiguas, para luego poder utilizar el comando `uniq` y contar las veces que una IP se repite.
* Finalmente, usamos nuevamente el comando `sort` para ordenar los resultados de mayor a menor a partir de un orden numérico.


## Requests Fallidas

`cut -d ' ' -f 1,6,7,8,9 "$1" | grep -E " 4[[:digit:]]{2}" | tr '"' '\t'`

* Como sabemos que los valores de cada log no cambian su posicion, usamos `cut` con valores fijos para las columnas que necesitamos.
* Luego filtramos aquellas lineas en las que el código de salida tiene la forma 4xx usando `grep`. Notar que el espacio inicial es intencional para ser preciso con el inicio del codigo de salida.
* Luego, como los recursos estan encerrados entre comillas, intercambiamos esas comiilas por '\\t' para que los datos queden separados por tabuladores usando `tr`.


## Recursos más Solicitado

`grep "\"GET " "$1" | cut -d ' ' -f 7 | sort | uniq -c | sort -nr | head -n 3`

* Filtramos con `grep` los logs que hayan utilizado el método GET. 
* Al igual que antes, usamos `cut` con valores fijos para aislar los path utilizados.
* Finalmente, utilizamos un pipeline como en el ejercicio 1 para ordenar los resultados y utilizamos el comando `head` para imprimir el top 3.

### Version Generalizada

`read -p "Ingrese el método a buscar: " var && grep "\"$var " "$1" | cut -d ' ' -f 7 | sort | uniq -c | sort -nr | head -n 3`

La diferencia está en que al inicio se pide un input al usuario para que ingrese un método. Esto hace que el pipeline esté generalizado.
