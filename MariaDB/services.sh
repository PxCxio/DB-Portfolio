#!/bin/bash


sqlFile="/tmp/services.sql"
echo "Generating SQL services table: "

egrep '(tcp|udp)' /etc/services | sed '/^#.*/d;/^$/d;s/\/.*$//;' |\
 sort -n -k 2 | uniq |\
 awk 'BEGIN {
	printf("TRUNCATE TABLE services;\n")
      } 
      $2 > 0 && $2 < 1025 {
	printf("INSERT INTO services(name, port)  VALUES (\"%s\", %d);\n", $1, $2)
      } 
      END {
	printf("COMMIT;\n")
      }' > $sqlFile

echo "Please Provide Password To Continue"

mysql cts4348 -u root -p < $sqlFile

