#!/bin/bash

# Pedimos al usuario que ingrese un valor
echo "1-. Contenedor de Mysql"
echo "2-. Contenedor de Apache"
read valor

# Usamos un case para imprimir diferentes mensajes según el valor ingresado
case "$valor" in
  1)
    echo "que contraseña quieres?"
    read password
    echo "Que nombre le quieres poner a la base?"
    read nomdb
    docker run -e MYSQL_ROOT_PASSWORD="$(echo $password)" -e MYSQL_DATABASE="$(echo $nomdb)" -d mysql
    ;;
  2)
    echo "Cual es tu path"
    read ruta
    docker run -d -p 8080:80 -v "$(echo $ruta)":/usr/local/apache2/htdocs/ httpd 
    ;;
  3)
    echo "Valor 3"
    ;;
  *)
    echo "Valor inválido. Debe ser del 1 al 3."
    ;;
esac
