#!/bin/bash

File="/tmp/firewall.sql"

read -d '' script << 'EOF'

{
    timestamp=substr($2,index($2,"(")+1,10)
    saddr=$11
    sub(/saddr=/,"",saddr)
    sport=$15
    sub(/sport=/,"",sport)
    dport=$16
    sub(/dport=/,"",dport)
    printf("INSERT INTO firewallLogs(timestamp, sourceIP, sourcePort, destinationPort) \\n")
    printf("VALUES(FROM_UNIXTIME(%d), '%s', %d, %d);\\n", timestamp,saddr,sport,dport)
}
END{ 
    printf("COMMIT;") 
   }

EOF

ausearch -if /var/log/audit/audit.log --raw -m NETFILTER_PKT | grep sport | awk "$script" > $File

mysql cts4348 -u root -p < $File

