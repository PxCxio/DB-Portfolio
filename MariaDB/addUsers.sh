#!/bin/bash

file=$1
File="/tmp/addUsers.sql"

if [[ -n "$file" && -f "$file" ]]; then
    read -d '' script << 'EOF'
{
    username = $1
    password = $2
    gender = $3
    title = $4
    firstname = $5
    lastname = $6 
    address = $7
    city = $8
    state = $9
    zip = $10
    email = $11
    telephone = $12
    split($13,bday,"/")
    birthday = bday[1]"/"bday[2]"/"bday[3]+1900
    zodiac = $14
    $1=$2=$3=$4=$5=$6=$7=$8=$9=$10=$11=$12=$13=$14=""
    OFS=","
    occupation = $0
    sub(/^[ \t",]+/, "", occupation);
    sub(/'/, "''", occupation);


    printf("INSERT INTO users(username,password,gender,title,firstname,lastname,address,city,state,zip,email,telephone,birthday,zodiac,occupation)\\n");
    printf("SELECT '%s',MD5('%s'),'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s',STR_TO_DATE('%s','%%m/%%d/%%Y'),id, '%s'\\n", username,\
	password,gender,title,firstname,lastname,address,city,state,zip,email,telephone,birthday,occupation);

    
printf("  from zodiac where lower(name) = '%s';\\n", tolower(zodiac));
}
END{ 
    printf("COMMIT;")
}
EOF
 awk -F"," "$script" $file > $File
 mysql cts4348 -u root -p < $File
else
    echo "argument error"
    exit 1
fi

