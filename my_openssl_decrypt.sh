#!/usr/bin/env bash

# Simple encryption script with openssl avilable on linux and windows git bash
usage() {
echo "Please provide the foloowing flags"
echo "  -e => (optional) encryption default"
echo "  -d => (optional) decryption"
echo "  -s => (required) string to be en/decrypted"
echo "  -p => (required) password for en/decryption"
}

#Get the parameteres of the script and assign them
while getopts edhs:p: flag
do
    case "${flag}" in
        d ) decrypt=true;;
        e ) decrypt=false;;
        s) string=${OPTARG};;
        p) password=${OPTARG};;
        h | *) # Display help.
          usage
          exit 0;;
    esac
done

#Check if all parameters are set, if not show an error message and exit the script
if [ -z "$string" ] || [ -z "$password" ]
    then echo "You need to set all variables to run the script: -s The string to encrypt/decrypt, -p The password for the encryption/decryption"
    exit 0
fi

if ${decrypt:true} ; then
    echo $string | openssl enc -base64 -d -aes-256-cbc -salt -pass pass:$password -pbkdf2
else
    echo $string | openssl enc -base64 -e -aes-256-cbc -salt -pass pass:$password -pbkdf2
fi
