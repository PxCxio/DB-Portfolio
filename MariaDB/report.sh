#!/bin/bash

echo "This program calculates the  number of user who share the same zodiac sign \n and calculates the number of hits on the firewalls in Descending order with its corresponding service name."

mysql cts4348 -u root -p -e "
select name, count(1) as num_of_users from zodiac z INNER JOIN users u on z.id = u.zodiac
group by name;

select name, count(1) as num_of_hits from services s INNER JOIN firewallLogs l on s.port=l.destinationPort
group by name
order by count(1) desc;"

